Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F9D1CDC6
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 08:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2DB10E33A;
	Tue,  9 Dec 2025 08:40:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0952B10E33A;
 Tue,  9 Dec 2025 08:40:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8364009009467799768=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_intel-ci=3A_Blocklist_kms?=
 =?utf-8?q?=5Fcolorop_tests_on_i915/xe_due_to_missing_writeback_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Dec 2025 08:40:30 -0000
Message-ID: <176526963001.68390.10039834378365600207@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251208113243.1242127-1-swati2.sharma@intel.com>
In-Reply-To: <20251208113243.1242127-1-swati2.sharma@intel.com>
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

--===============8364009009467799768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Blocklist kms_colorop tests on i915/xe due to missing writeback support
URL   : https://patchwork.freedesktop.org/series/158639/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8659_FULL -> XEIGTPW_14171_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14171_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14171_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14171_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html

  * igt@kms_flip@modeset-vs-vblank-race@a-dp2:
    - shard-bmg:          [PASS][3] -> ([FAIL][4], [PASS][5]) +2 other tests ( 1 fail, 1 pass )
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_pm_rpm@basic-rte.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][8], [SKIP][9]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [PASS][10] -> ([INCOMPLETE][11], [PASS][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14171_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
    - shard-lnl:          NOTRUN -> ([FAIL][13], [FAIL][14]) ([Intel XE#6676]) +36 other tests ( 2 fail )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> ([SKIP][15], [SKIP][16]) ([Intel XE#664])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_async_flips@test-cursor.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> ([SKIP][17], [SKIP][18]) ([Intel XE#1407]) +1 other test ( 2 skip )
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][19], [SKIP][20]) ([Intel XE#2327])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#6703]) +78 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6703]) +14 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#2328])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#610])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#1124]) +3 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [PASS][41] -> ([SKIP][42], [PASS][43]) ([Intel XE#367]) +2 other tests ( 1 pass, 1 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#367]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#2887] / [Intel XE#6703])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#455] / [Intel XE#787]) +15 other tests ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#787]) +55 other tests ( 2 skip )
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#6173]) +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#3432])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#3432])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2907])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-lnl:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#2669]) +3 other tests ( 2 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2887]) +5 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> ([PASS][65], [INCOMPLETE][66]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][67], [PASS][68]) ([Intel XE#6168] / [i915#14968])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][69], [PASS][70]) ([Intel XE#1727] / [Intel XE#3113])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#2652] / [Intel XE#787]) +8 other tests ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2887])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#2325])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_chamelium_color@gamma.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#373])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#373])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#2252]) +4 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2252])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#373]) +4 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#2321])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][87], [SKIP][88]) ([Intel XE#308])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2320])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#1424]) +2 other tests ( 2 skip )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#2321] / [Intel XE#6703])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#2320]) +3 other tests ( 2 skip )
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          NOTRUN -> ([PASS][96], [FAIL][97]) ([Intel XE#6747]) +2 other tests ( 1 fail, 1 pass )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#309])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#309])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#323])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#1508])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#2244])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_dsc@dsc-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#4422])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#4422])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][110], [SKIP][111]) ([Intel XE#4156])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#776])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#1137])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#2374])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - shard-bmg:          [PASS][120] -> [FAIL][121] ([Intel XE#3650]) +3 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][122] -> ([FAIL][123], [PASS][124]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-bmg:          [PASS][125] -> ([FAIL][126], [PASS][127]) ([Intel XE#3650]) +3 other tests ( 1 fail, 1 pass )
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> ([FAIL][128], [FAIL][129]) ([Intel XE#4683]) +1 other test ( 2 fail )
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#455]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#1401] / [Intel XE#1745]) +2 other tests ( 2 skip )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#1401]) +2 other tests ( 2 skip )
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2311]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#651])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#2311]) +6 other tests ( 2 skip )
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#651]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4141]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][147], [SKIP][148]) ([Intel XE#4141] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#653]) +11 other tests ( 2 skip )
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#2313]) +12 other tests ( 2 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#6312])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2313]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#6312]) +1 other test ( 2 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#653]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#656]) +4 other tests ( 2 skip )
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#656]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-handle-protection:
    - shard-bmg:          [PASS][165] -> ([SKIP][166], [PASS][167]) ([Intel XE#6557] / [Intel XE#6703]) +1 other test ( 1 pass, 1 skip )
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_getfb@getfb-handle-protection.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_getfb@getfb-handle-protection.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_getfb@getfb-handle-protection.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][168] ([Intel XE#6740])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][169], [SKIP][170]) ([Intel XE#1503])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_hdr@static-toggle.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([Intel XE#6590])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#2925])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#4090] / [Intel XE#6590] / [Intel XE#6703])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#5825]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#5825]) +4 other tests ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#5825]) +3 other tests ( 2 skip )
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> ([SKIP][182], [SKIP][183]) ([Intel XE#1439] / [Intel XE#3141])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> ([PASS][184], [SKIP][185]) ([Intel XE#6693])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1406] / [Intel XE#1489])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +1 other test ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][189], [SKIP][190]) ([Intel XE#1406] / [Intel XE#4608]) +3 other tests ( 2 skip )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#1406] / [Intel XE#1489]) +2 other tests ( 2 skip )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-bmg:          NOTRUN -> ([SKIP][193], [SKIP][194]) ([Intel XE#1406] / [Intel XE#1489]) +1 other test ( 2 skip )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#1406] / [Intel XE#2387])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#1122] / [Intel XE#1406])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-lnl:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#1406]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][203], [SKIP][204]) ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#1406] / [Intel XE#4609])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#1406] / [Intel XE#2939])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][212], [SKIP][213]) ([Intel XE#3414] / [Intel XE#3904]) +2 other tests ( 2 skip )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          NOTRUN -> ([SKIP][214], [SKIP][215]) ([Intel XE#6503] / [Intel XE#6703])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_sharpness_filter@filter-modifiers.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#6503])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_sharpness_filter@filter-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_sharpness_filter@filter-toggle.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#362])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-idle-hang:
    - shard-bmg:          [PASS][222] -> ([PASS][223], [DMESG-FAIL][224]) ([Intel XE#5545]) +1 other test ( 1 dmesg-fail, 1 pass )
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@kms_vblank@query-idle-hang.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_vblank@query-idle-hang.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_vblank@query-idle-hang.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][225] -> ([FAIL][226], [PASS][227]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#1091] / [Intel XE#2849])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#5300])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_copy_basic@mem-page-copy-17.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([Intel XE#2504])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-lnl:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([Intel XE#4837])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_eudebug@basic-exec-queues.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#4837])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_eudebug@basic-vm-access-faultable.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#4837])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#4837])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-bmg:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#4837])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_eudebug@sysfs-toggle.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#4837] / [Intel XE#6665])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#4837] / [Intel XE#6665])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#4837] / [Intel XE#6665]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@single-step:
    - shard-lnl:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#4837] / [Intel XE#6665]) +2 other tests ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_eudebug_online@single-step.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#4518])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#688]) +1 other test ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_evict@evict-beng-small-multi-vm.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#688])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#2322]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][255], [SKIP][256]) ([Intel XE#1392])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#1392]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#288]) +7 other tests ( 2 skip )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#288])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-imm.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][263], [SKIP][264]) ([Intel XE#5007]) +1 other test ( 2 skip )
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - shard-bmg:          NOTRUN -> ([SKIP][265], [PASS][266]) ([Intel XE#6703]) +8 other tests ( 1 pass, 1 skip )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html

  * igt@xe_exec_system_allocator@many-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#4943])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_allocator@many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][268] -> ([WARN][269], [PASS][270]) ([Intel XE#5786])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> ([WARN][271], [WARN][272]) ([Intel XE#5786])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@once-malloc-madvise:
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#4915]) +34 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_exec_system_allocator@once-malloc-madvise.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][274] -> ([PASS][275], [FAIL][276]) ([Intel XE#5625])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][277], [PASS][278]) ([Intel XE#6557] / [Intel XE#6703]) +4 other tests ( 1 pass, 1 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#4915]) +124 other tests ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          [PASS][282] -> ([SKIP][283], [PASS][284]) ([Intel XE#6703]) +102 other tests ( 1 pass, 1 skip )
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-new.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][285] ([Intel XE#4943]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap:
    - shard-bmg:          [PASS][286] -> [SKIP][287] ([Intel XE#6557] / [Intel XE#6703]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mmap.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#4943]) +11 other tests ( 2 skip )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#4943]) +5 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#6281])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#2229])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319]) -> ([PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [SKIP][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [SKIP][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367]) ([Intel XE#378])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][368] ([Intel XE#3573])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#3573]) +2 other tests ( 2 skip )
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][371] ([Intel XE#6566])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][372] ([Intel XE#5694])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][373] ([Intel XE#584])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pm@s3-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#579])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][376] -> ([FAIL][377], [FAIL][378]) ([Intel XE#6251])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][379] -> [FAIL][380] ([Intel XE#6251]) +3 other tests fail
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [PASS][381] -> ([PASS][382], [FAIL][383]) ([Intel XE#5937])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][384] -> [FAIL][385] ([Intel XE#5937])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> ([SKIP][386], [SKIP][387]) ([Intel XE#4733])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_pxp@pxp-optout.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][388] ([Intel XE#4733]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][389] ([Intel XE#4733]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([Intel XE#944]) +1 other test ( 2 skip )
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_query@multigpu-query-invalid-size.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#4130])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#4130])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#6318])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_sriov_vram@vf-access-beyond.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_sriov_vram@vf-access-beyond.html
    - shard-lnl:          NOTRUN -> [SKIP][398] ([Intel XE#6376])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [PASS][399] -> ([PASS][400], [DMESG-FAIL][401]) ([Intel XE#3876])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][402] ([Intel XE#5354]) -> ([PASS][403], [PASS][404])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][405] ([Intel XE#4633]) -> ([PASS][406], [PASS][407])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][408] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][409], [PASS][410]) +1 other test ( 2 pass )
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][411] ([Intel XE#5338] / [Intel XE#5408] / [Intel XE#6266]) -> ([PASS][412], [PASS][413]) +1 other test ( 2 pass )
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][414] ([Intel XE#6740]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#455]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][418] ([Intel XE#718]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][420] ([Intel XE#718]) -> ([PASS][421], [PASS][422]) +1 other test ( 2 pass )
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [FAIL][423] ([Intel XE#6407]) -> ([PASS][424], [PASS][425])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_gt_freq@freq_fixed_idle.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][426] ([Intel XE#2327]) -> [SKIP][427] ([Intel XE#6703])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][428] ([Intel XE#1124]) -> ([SKIP][429], [SKIP][430]) ([Intel XE#1124] / [Intel XE#6703]) +1 other test ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][431] ([Intel XE#1124]) -> [SKIP][432] ([Intel XE#6703])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][433] ([Intel XE#367]) -> ([SKIP][434], [SKIP][435]) ([Intel XE#367] / [Intel XE#6703])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][436] ([Intel XE#2887]) -> [SKIP][437] ([Intel XE#6703])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][438] ([Intel XE#2652] / [Intel XE#787]) -> ([SKIP][439], [SKIP][440]) ([Intel XE#2652] / [Intel XE#6703] / [Intel XE#787])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][441] ([Intel XE#2887]) -> ([SKIP][442], [SKIP][443]) ([Intel XE#2887] / [Intel XE#6703]) +1 other test ( 2 skip )
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][444] ([Intel XE#2724]) -> [SKIP][445] ([Intel XE#6703])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_cdclk@plane-scaling.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][446] ([Intel XE#2252]) -> ([SKIP][447], [SKIP][448]) ([Intel XE#2252] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][449] ([Intel XE#2252]) -> [SKIP][450] ([Intel XE#6703])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][451] ([Intel XE#2390]) -> [SKIP][452] ([Intel XE#6703])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][453] ([Intel XE#2321]) -> [SKIP][454] ([Intel XE#6703])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          [SKIP][455] ([Intel XE#2320]) -> ([SKIP][456], [SKIP][457]) ([Intel XE#2320] / [Intel XE#6703])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][458] ([Intel XE#2321]) -> [SKIP][459] ([Intel XE#6557] / [Intel XE#6703])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][460] ([Intel XE#6715]) -> ([FAIL][461], [FAIL][462]) ([Intel XE#4633])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][463] ([Intel XE#4354]) -> [SKIP][464] ([Intel XE#6703])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][465] ([Intel XE#4354]) -> ([SKIP][466], [FAIL][467]) ([Intel XE#4354] / [Intel XE#6793])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][468] ([Intel XE#2244]) -> [SKIP][469] ([Intel XE#6703])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][470] ([Intel XE#2293] / [Intel XE#2380]) -> ([SKIP][471], [SKIP][472]) ([Intel XE#2293] / [Intel XE#2380] / [Intel XE#6703])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][473] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][474] ([Intel XE#6703])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][475] ([Intel XE#2311]) -> [SKIP][476] ([Intel XE#6703]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][477] ([Intel XE#2311]) -> [SKIP][478] ([Intel XE#6557] / [Intel XE#6703])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][479] ([Intel XE#2311]) -> ([SKIP][480], [SKIP][481]) ([Intel XE#2311] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          [SKIP][482] ([Intel XE#2313]) -> [SKIP][483] ([Intel XE#6703]) +4 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-bmg:          [SKIP][484] ([Intel XE#2313]) -> [SKIP][485] ([Intel XE#6557] / [Intel XE#6703])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][486] ([Intel XE#2313]) -> ([SKIP][487], [SKIP][488]) ([Intel XE#2313] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][489] ([Intel XE#6740]) -> ([PASS][490], [ABORT][491]) ([Intel XE#6740]) +1 other test ( 1 abort, 1 pass )
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][492] ([Intel XE#1503]) -> ([SKIP][493], [ABORT][494]) ([Intel XE#1503] / [Intel XE#6740])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][495] ([Intel XE#346] / [Intel XE#6590]) -> ([SKIP][496], [SKIP][497]) ([Intel XE#346] / [Intel XE#6590] / [Intel XE#6703])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][498] ([Intel XE#4329]) -> ([SKIP][499], [SKIP][500]) ([Intel XE#4329] / [Intel XE#6703])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][501] ([Intel XE#5021]) -> [SKIP][502] ([Intel XE#6703])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][503] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][504] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][505] ([Intel XE#1406] / [Intel XE#1489]) -> ([SKIP][506], [SKIP][507]) ([Intel XE#1406] / [Intel XE#1489] / [Intel XE#6703]) +1 other test ( 2 skip )
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][508] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][509], [SKIP][510]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) +1 other test ( 2 skip )
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@pr-sprite-render.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][511] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][512] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_psr@psr-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][513] ([Intel XE#3414] / [Intel XE#3904]) -> ([SKIP][514], [SKIP][515]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#6703]) +1 other test ( 2 skip )
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][516] ([Intel XE#1435]) -> ([SKIP][517], [SKIP][518]) ([Intel XE#1435] / [Intel XE#6703])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][519] ([Intel XE#6503]) -> [SKIP][520] ([Intel XE#6703])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][521] ([Intel XE#2426]) -> ([FAIL][522], [FAIL][523]) ([Intel XE#1729])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][524] ([Intel XE#1729]) -> ([SKIP][525], [FAIL][526]) ([Intel XE#1729] / [Intel XE#362])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][527] ([Intel XE#2509]) -> ([SKIP][528], [SKIP][529]) ([Intel XE#2426] / [Intel XE#2509])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][530] ([Intel XE#1499]) -> [SKIP][531] ([Intel XE#6703])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][532] ([Intel XE#1499]) -> ([SKIP][533], [SKIP][534]) ([Intel XE#1499] / [Intel XE#6703])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][535] ([Intel XE#2142]) -> ([PASS][536], [FAIL][537]) ([Intel XE#2142]) +1 other test ( 1 fail, 1 pass )
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][538] ([Intel XE#6740]) -> [SKIP][539] ([Intel XE#6703])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@testdisplay.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@testdisplay.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-bmg:          [SKIP][540] ([Intel XE#4837]) -> [SKIP][541] ([Intel XE#6703])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][542] ([Intel XE#4837]) -> ([SKIP][543], [SKIP][544]) ([Intel XE#4837] / [Intel XE#6557] / [Intel XE#6703])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          [SKIP][545] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][546] ([Intel XE#6703])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][547] ([Intel XE#6321]) -> ([PASS][548], [INCOMPLETE][549]) ([Intel XE#6321])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][550] ([Intel XE#2322]) -> [SKIP][551] ([Intel XE#6703]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          [SKIP][552] ([Intel XE#2322]) -> ([SKIP][553], [SKIP][554]) ([Intel XE#2322] / [Intel XE#6703])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][555] ([Intel XE#4943]) -> [SKIP][556] ([Intel XE#6703]) +2 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge:
    - shard-bmg:          [SKIP][557] ([Intel XE#4943]) -> ([SKIP][558], [SKIP][559]) ([Intel XE#4943] / [Intel XE#6703]) +5 other tests ( 2 skip )
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-6/igt@xe_exec_system_allocator@once-mmap-free-huge.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-free-huge.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-free-huge.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][560] ([Intel XE#2284]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#2284] / [Intel XE#6703])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][563] ([Intel XE#4733]) -> [SKIP][564] ([Intel XE#6703])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][565] ([Intel XE#944]) -> ([SKIP][566], [SKIP][567]) ([Intel XE#6703] / [Intel XE#944])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6173
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * IGT: IGT_8659 -> IGTPW_14171
  * Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -> xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f

  IGTPW_14171: 14171
  IGT_8659: 8659
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7fca330da8b2806732
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875fdc8ffb29627d054f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/index.html

--===============8364009009467799768==
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
<tr><td><b>Series:</b></td><td>intel-ci: Blocklist kms_colorop tests on i91=
5/xe due to missing writeback support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158639/">https://patchwork.freedesktop.org/series/158639/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14171/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8659_FULL -&gt; XEIGTPW_14171_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14171_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14171_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
171_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sha=
rd-bmg-6/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
1/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race@a-dp2.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/i=
gt@kms_flip@modeset-vs-vblank-race@a-dp2.html">PASS</a>) +2 other tests ( 1=
 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@=
kms_pm_rpm@basic-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#31=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-inval=
idate.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userpt=
r-invalidate.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_balancer@many-cm-virtual=
-userptr-invalidate.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14171_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-=
1-linear-rgb565:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_async_flips@basic-modeset-w=
ith-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@=
kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linea=
r-rgb565.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6676">Intel XE#6676</a>) +36 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_async_flips@test-cursor.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-lnl-1/igt@kms_async_flips@test-cursor.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">I=
ntel XE#1407</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +78 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate=
-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/=
shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_big_fb@y-tile=
d-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2=
160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-=
3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-=
3840x2160p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +2 other tests ( 1 pass, 1 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-=
gen12-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2887">Intel XE#2887</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14171/shard-lnl-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-r=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_ccs@ccs-on-ano=
ther-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_ccs@crc-primary=
-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6173">Intel XE#6173</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-t=
iled-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled=
-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2669">Intel XE#2669</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2887">Intel XE#2887</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Inte=
l XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i91=
5#14968</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled=
-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_chamelium_color@gamma.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171=
/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_chamelium_edid@dp-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_chamelium_frames@dp-frame-du=
mp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/=
shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-with=
-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14171/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-mov=
ement-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14171/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128=
x42.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-5=
12x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-6=
4x21.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747">Intel XE#6747=
</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cu=
rsor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_cursor_le=
gacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14171/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#15=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_dsc@dsc-basic.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-l=
nl-5/igt@kms_dsc@dsc-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-out-visible-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171=
/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171=
/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14171/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#11=
37</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_feature_discovery@psr2.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
1/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-lnl-2/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#=
1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sha=
rd-bmg-6/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail=
, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shar=
d-bmg-6/igt@kms_flip@modeset-vs-vblank-race.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_flip@=
modeset-vs-vblank-race.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3650">Intel XE#3650</a>) +3 other tests ( 1 fai=
l, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-=
xtile-to-64bpp-xtile-upscaling.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_flip_scaled_crc@fl=
ip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 ot=
her test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt=
@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-=
valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-16bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">In=
tel XE#2380</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-defa=
ult-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1401">Intel XE#1401</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p=
-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_frontbuffer_tracki=
ng@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2=
p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-ti=
ling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linea=
r.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1=
p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
1p-offscreen-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_frontbuffer_=
tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a=
>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@kms_frontbuffer_track=
ing@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-protection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_getfb@getfb-handle-protection.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sh=
ard-bmg-2/igt@kms_getfb@getfb-handle-protection.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_g=
etfb@getfb-handle-protection.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1=
 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-=
a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_hdr@static-toggle.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sha=
rd-lnl-3/igt@kms_hdr@static-toggle.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#=
6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-u=
ltra-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra=
-joiner-big-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5825">Intel XE#5825</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-a.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5825">Intel XE#5825</a>) +4 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-b.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5825">Intel XE#5825</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-str=
ess-no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wai=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpm=
s.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel X=
E#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_psr2_sf@fbc-ps=
r2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">In=
tel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4608">Intel XE#4608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_p=
sr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-ove=
rlay-plane-update-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +2 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-pl=
ane-update-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-update-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb888=
8.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel X=
E#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-lnl-4/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render@=
edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_psr@pr-cursor-plane-onoff.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-bmg-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr@psr2-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_rotation_crc@primary-rotati=
on-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_sharpness_filter@filter-mod=
ifiers.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@filter-modifiers.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/650=
3">Intel XE#6503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@kms_sharpness_filter@filter-sus=
pend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@filter-suspend.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">I=
ntel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-dg2-434/igt@kms_sharpness_filter@filter-toggle.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_vblank@query-idle-hang.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg=
-8/igt@kms_vblank@query-idle-hang.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_vblank@query-id=
le-hang.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test ( 1 dmesg-fail, 1=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-=
2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_copy_basic@mem-page-copy-1=
7.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-dg2-433/igt@xe_copy_basic@mem-page-copy-17.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300">Intel X=
E#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_create@multigpu-create-massi=
ve-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_eudebug@basic-exec-queues.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-lnl-5/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_eudebug@basic-vm-access-fa=
ultable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-dg2-433/igt@xe_eudebug@basic-vm-access-faultable.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_eudebug@discovery-empty-cli=
ents.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_eudebug@sysfs-toggle.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-bmg-1/igt@xe_eudebug@sysfs-toggle.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_eudebug_online@breakpoint-man=
y-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_eudebug_online@breakpo=
int-many-sessions-single-tile.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_eudebug_online@set-breakpoin=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel X=
E#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6665">Intel XE#6665</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_eudebug_online@single-step.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-lnl-2/igt@xe_eudebug_online@single-step.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665"=
>Intel XE#6665</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_evict@evict-beng-small-multi=
-vm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14171/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Inte=
l XE#688</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@xe_evict@evict-threads-small.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1=
392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bin=
dexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_exec_basic@multigpu-once=
-bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_fault_mode@many-binde=
xecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_fault_mode@many=
-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_exec_fault_mode@twice-userp=
tr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt@xe_exec_system_allocator@many-6=
4k-mmap-new-huge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@ma=
ny-64k-mmap-new-huge-nomemset.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@many-l=
arge-execqueues-malloc-mlock.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator=
@many-large-execqueues-malloc-mlock.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_allocator@many-mm=
ap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-pref=
etch.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-mallo=
c-prefetch.html">WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mallo=
c-prefetch.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_exec_system_allocator@many-s=
tride-malloc-prefetch-madvise.html">WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@xe_exec_system_allocato=
r@many-stride-malloc-prefetch-madvise.html">WARN</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-madvise:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_exec_system_allocator@once-=
malloc-madvise.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4915">Intel XE#4915</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-lnl-5/igt@xe_exec_system_allocator@pat-i=
ndex-madvise-pat-idx-uc-single-vma.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_all=
ocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlo=
ck-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@proces=
s-many-large-execqueues-mmap-file-mlock-nomemset.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_e=
xec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests ( 1 pass, 1 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@process=
-many-large-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-prefetch-shared.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_exec_system=
_allocator@process-many-stride-mmap-prefetch-shared.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +124 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-new.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-new.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) +102 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_exec_system_allocator@threads=
-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mma=
p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-m=
map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@thread=
s-shared-vm-many-mmap-new-huge.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-mmap-new-huge.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_exec_system_allocator@twice-=
large-mmap-free-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_exec_system_allocator@twice-l=
arge-mmap-free-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_fault_injection@exec-queue-c=
reate-fail-xe_pxp_exec_queue_add.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-4/igt@xe_fault_injection@e=
xec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-=
dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8659/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8659/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8659/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8659/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_865=
9/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8659/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8659/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8659/shard-dg2-435/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8659/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shar=
d-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2=
-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-433/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-dg2-435/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2=
-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-432/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shar=
d-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14171/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
171/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_oa@privileged-forked-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_oa@whitelisted-registers-u=
serspace-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspa=
ce-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pm@s3-basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE=
#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe=
_engine_class_video_decode0.html">PASS</a> -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@xe_pmu@engine-activ=
ity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-5/=
igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_dec=
ode0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sh=
ard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a=
>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard=
-bmg-1/igt@xe_pmu@fn-engine-activity-load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_pmu@fn-e=
ngine-activity-load.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel =
XE#5937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-b=
mg-4/igt@xe_pxp@pxp-optout.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-463/igt@xe_pxp@pxp-termination-key-upd=
ate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@xe_pxp@pxp-termination-key-updat=
e-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_query@multigpu-query-invalid=
-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-433/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_sriov_auto_pro=
visioning@resources-released-on-vfs-disabling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-lnl-2/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-4/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt@xe_sriov_vram@vf-access-beyon=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-dg2-433/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318">Intel X=
E#6318</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-lnl-1/igt@xe_sriov_vram@vf-access-beyond.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6376">Intel XE#6376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2=
-463/igt@xe_vm@bind-array-enobufs.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-464/igt@xe_vm@bind-array-=
enobufs.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_cursor=
_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633=
">Intel XE#4633</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-435/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14171/shard-dg2-432/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5=
338</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/54=
08">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6266">Intel XE#6266</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_flip@wf_vblank-ts-che=
ck.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>) +1 oth=
er test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6=
740</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-l=
nl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard=
-lnl-5/igt@kms_pm_dc@dc6-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14171/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html=
">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407">Intel XE#=
6407</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-dg2-464/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-dg2-434/igt=
@xe_gt_freq@freq_fixed_idle.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_big_fb@y-til=
ed-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_=
big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14171/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x108=
0p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
7">Intel XE#367</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4=
-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2887">Intel XE#2887</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tile=
d-gen12-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen=
12-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
1/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel =
XE#2252</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14171/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard=
-bmg-8/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">I=
ntel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14171/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557=
">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715=
">Intel XE#6715</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4171/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Int=
el XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14171/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14171/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-6/igt=
@kms_dp_link_training@uhbr-sst.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6793">Intel XE#6793</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1417=
1/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg=
-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14171/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-y=
tilegen12rcccs-downscaling.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-yt=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuff=
er_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#=
6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
3">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-3/igt@kms_hdr@bp=
c-switch-dpms.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test ( 1 abort, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sh=
ard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@kms_hdr@invalid-hdr=
.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1503">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#34=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590=
">Intel XE#6590</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14171/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-b=
mg-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329"=
>Intel XE#4329</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel =
XE#4329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel =
XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr2_sf@p=
r-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr2_s=
f@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-8/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"=
>Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-bmg-8/igt@kms_psr@pr-sprite-render.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel =
XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Inte=
l XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_psr@psr-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Inte=
l XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel X=
E#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14171/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14171/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@kms_sharpness_filter@invalid-plane-with-filter.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-=
with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/s=
hard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_141=
71/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel =
XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/sh=
ard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14171/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard=
-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14171/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtua=
l@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14171/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pip=
e-a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2142">Intel XE#2142</a>) +1 other test ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@testdisplay.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-=
2/igt@testdisplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">=
Intel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
37">Intel XE#4837</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14171/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconne=
ct.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-ta=
rget-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_eudebug=
_online@writes-caching-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6321">Intel XE#6321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14171/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many=
-threads-small.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14171/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads=
-small.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_basic@multi=
gpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2322">Intel XE#2322</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-user=
ptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-reb=
ind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-m=
map-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_alloca=
tor@many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-6/igt@xe_exec_system_allocator@once-mmap-free-huge.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4943">Intel XE#4943</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-f=
ree-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14171/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-free-huge=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4943">Intel XE#4943</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2/i=
gt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14171/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-terminatio=
n-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8659/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14171/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14171/shard-bmg-2=
/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944<=
/a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8659 -&gt; IGTPW_14171</li>
<li>Linux: xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732 -&gt; xe-4208-4=
8deab361d3b570e2210875fdc8ffb29627d054f</li>
</ul>
<p>IGTPW_14171: 14171<br />
  IGT_8659: 8659<br />
  xe-4205-20a0f6f7ed00cc169a15fe7fca330da8b2806732: 20a0f6f7ed00cc169a15fe7=
fca330da8b2806732<br />
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875=
fdc8ffb29627d054f</p>

</body>
</html>

--===============8364009009467799768==--
