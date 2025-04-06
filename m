Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A9C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 19:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4DD10E059;
	Sun,  6 Apr 2025 19:35:20 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785810E059;
 Sun,  6 Apr 2025 19:35:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7577154045456147523=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fault_variations_of_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 19:35:18 -0000
Message-ID: <174396811879.41253.800211078996989508@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328124555.255036-1-jan.sokolowski@intel.com>
In-Reply-To: <20250328124555.255036-1-jan.sokolowski@intel.com>
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

--===============7577154045456147523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fault variations of tests
URL   : https://patchwork.freedesktop.org/series/146949/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12877_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12877_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12877_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12877_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][2] -> ([PASS][3], [INCOMPLETE][4])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html

  * {igt@xe_eudebug@basic-vm-access-faultable} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][6] +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_eudebug@basic-vm-access-faultable.html

  * {igt@xe_eudebug@vm-bind-clear-faultable} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-faultable.html

  * {igt@xe_eudebug@vma-ufence-faultable} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][8] +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultable.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][9] -> ([FAIL][10], [INCOMPLETE][11]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_content_protection@srm.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_content_protection@srm.html

  
New tests
---------

  New tests have been introduced between XEIGT_8292_FULL and XEIGTPW_12877_FULL:

### New IGT tests (8) ###

  * igt@xe_eudebug@basic-vm-access-faultable:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug@vma-ufence-faultable:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12877_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4173]) +2 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][14] -> ([FAIL][15], [PASS][16]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#3767]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#2327])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#610])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][35] -> ([SKIP][36], [PASS][37]) ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][38] -> ([PASS][39], [SKIP][40]) ([Intel XE#2191]) +1 other test ( 1 pass, 1 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#2314] / [Intel XE#2894])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#2191])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#787]) +52 other tests ( 2 skip )
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +169 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2887]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#3432])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#455] / [Intel XE#787]) +17 other tests ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#2907])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2887]) +4 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][65] -> ([PASS][66], [INCOMPLETE][67]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test ( 1 incomplete, 1 pass )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#4418])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4417]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4416]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_chamelium_color@degamma.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#306])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_chamelium_color@degamma.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#373]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2252]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#373]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#373])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#2252]) +2 other tests ( 2 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#1178])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#307])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> ([SKIP][87], [SKIP][88]) ([Intel XE#2390])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][89] ([Intel XE#1178])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#2320])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#2321]) +1 other test ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#308])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#2321])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2320]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1424])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2291])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#309])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#309]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][105] -> ([PASS][106], [SKIP][107]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][108] -> ([SKIP][109], [SKIP][110]) ([Intel XE#309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#309])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-lnl:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([Intel XE#309])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2291]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][116], [SKIP][117]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#309])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][119] -> ([PASS][120], [SKIP][121]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#323])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][123], [SKIP][124]) ([Intel XE#1508])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4354])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4354])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][127] -> ([SKIP][128], [PASS][129]) ([Intel XE#4294])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#455]) +7 other tests ( 2 skip )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#2244])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][134] -> ([PASS][135], [FAIL][136]) ([Intel XE#4164] / [i915#4767])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#776])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#776])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2373])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#2374])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#1135])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#1421])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][148] -> ([PASS][149], [SKIP][150]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#310])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][153] -> ([SKIP][154], [SKIP][155]) ([Intel XE#310])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][156] ([Intel XE#3321]) +7 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [PASS][157] -> ([SKIP][158], [SKIP][159]) ([Intel XE#2316])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> ([PASS][160], [SKIP][161]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][162], [SKIP][163]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][164] -> ([PASS][165], [INCOMPLETE][166]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][167] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a2-dp2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1421]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#310])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2316])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][171] -> [SKIP][172] ([Intel XE#2316])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][173] -> ([SKIP][174], [PASS][175]) ([Intel XE#2316]) +6 other tests ( 1 pass, 1 skip )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][176] -> ([PASS][177], [FAIL][178]) ([Intel XE#301])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][179] -> ([FAIL][180], [PASS][181]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][182] -> ([FAIL][183], [PASS][184]) ([Intel XE#301]) +5 other tests ( 1 fail, 1 pass )
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][185] -> [FAIL][186] ([Intel XE#301]) +6 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][187] -> [FAIL][188] ([Intel XE#301] / [Intel XE#3321])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][189] -> ([PASS][190], [FAIL][191]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][192] -> ([INCOMPLETE][193], [PASS][194]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][195] -> [DMESG-WARN][196] ([Intel XE#2953] / [Intel XE#4173])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][197] -> ([FAIL][198], [PASS][199]) ([Intel XE#886]) +3 other tests ( 1 fail, 1 pass )
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2293]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#2293] / [Intel XE#2380]) +1 other test ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#1401] / [Intel XE#1745])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#1401])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][210] -> [DMESG-FAIL][211] ([Intel XE#4543]) +1 other test dmesg-fail
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][212], [SKIP][213]) ([Intel XE#2311]) +13 other tests ( 2 skip )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][214], [SKIP][215]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#2312]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#2311]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][218] -> ([PASS][219], [SKIP][220]) ([Intel XE#656]) +10 other tests ( 1 pass, 1 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([PASS][223], [SKIP][224]) ([Intel XE#656]) +4 other tests ( 1 pass, 1 skip )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [PASS][225] -> ([SKIP][226], [SKIP][227]) ([Intel XE#656])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [PASS][228] -> [SKIP][229] ([Intel XE#656]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#656]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#4141]) +5 other tests ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#4141]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#651]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#651]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#2311] / [Intel XE#2312])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#651])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#2313]) +13 other tests ( 2 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#656]) +6 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][246], [SKIP][247]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#653] / [Intel XE#656]) +5 other tests ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#653]) +6 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#2313]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#656]) +1 other test ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#656]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][255], [SKIP][256]) ([Intel XE#653]) +8 other tests ( 2 skip )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#455]) +8 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#3374] / [Intel XE#3544])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][260] -> ([SKIP][261], [SKIP][262]) ([Intel XE#455])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][263] -> ([PASS][264], [SKIP][265]) ([Intel XE#1503]) +1 other test ( 1 pass, 1 skip )
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#1450]) +1 other test ( 2 skip )
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#1450] / [Intel XE#2568]) +1 other test ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][270] -> ([SKIP][271], [PASS][272]) ([Intel XE#3012])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][273] ([Intel XE#616]) +5 other tests fail
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][274] -> ([SKIP][275], [PASS][276]) ([Intel XE#4596])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][277] -> [SKIP][278] ([Intel XE#4596])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][279] ([Intel XE#4212]) +1 other test dmesg-warn
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][280] ([Intel XE#4540])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#2763]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#870])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#870])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#870])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#1122])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][293] ([Intel XE#2392])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][294] ([Intel XE#1430])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#908])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> ([PASS][297], [SKIP][298]) ([Intel XE#836])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][299] -> ([PASS][300], [SKIP][301]) ([Intel XE#836])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-lnl:          NOTRUN -> [SKIP][302] ([Intel XE#1439] / [Intel XE#3141])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#2893])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][304], [SKIP][305]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#1489]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
    - shard-lnl:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#2893])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#1489]) +4 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> ([SKIP][311], [SKIP][312]) ([Intel XE#2387])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#1122])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][316] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_psr@pr-basic.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> ([SKIP][319], [SKIP][320]) ([Intel XE#1406])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_psr@pr-cursor-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][321] ([Intel XE#1406])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr@psr2-no-drrs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#2414])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][326], [SKIP][327]) ([Intel XE#2939])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][328] ([Intel XE#3414] / [Intel XE#3904])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#3414] / [Intel XE#3904])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][331] -> ([FAIL][332], [PASS][333]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_setmode@basic.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][334] -> [SKIP][335] ([Intel XE#1435])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][336], [PASS][337]) ([Intel XE#455])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][338] -> ([FAIL][339], [FAIL][340]) ([Intel XE#771] / [Intel XE#899])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][341] -> ([FAIL][342], [PASS][343]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][344] -> [SKIP][345] ([Intel XE#455])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][346] ([Intel XE#1499]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#756])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_writeback@writeback-check-output.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][349] ([Intel XE#756])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][350], [SKIP][351]) ([Intel XE#1091] / [Intel XE#2849])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][352] ([Intel XE#1091] / [Intel XE#2849])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#1126])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#2905])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#2905] / [Intel XE#3889])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-lnl:          NOTRUN -> [SKIP][359] ([Intel XE#2905])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][360], [SKIP][361]) ([Intel XE#2905]) +6 other tests ( 2 skip )
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_eudebug_online@resume-one.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][364] ([Intel XE#2905]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][365] ([Intel XE#2905]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#4518])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][368], [SKIP][369]) ([Intel XE#4518])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> ([SKIP][370], [SKIP][371]) ([Intel XE#688]) +1 other test ( 2 skip )
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_evict@evict-large-external.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][372] ([Intel XE#688]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][373] ([Intel XE#1392])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][376] -> ([PASS][377], [SKIP][378]) ([Intel XE#1392]) +7 other tests ( 1 pass, 1 skip )
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#1392])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][381] ([Intel XE#2322]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][382] -> [SKIP][383] ([Intel XE#1392]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([PASS][384], [SKIP][385]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][386], [SKIP][387]) ([Intel XE#288]) +13 other tests ( 2 skip )
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][388] ([Intel XE#288]) +7 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][389] -> [DMESG-WARN][390] ([Intel XE#3876])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#560])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][392] ([Intel XE#378])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@buffer-fill@rcs-0:
    - shard-lnl:          [PASS][393] -> ([FAIL][394], [PASS][395]) ([Intel XE#4565]) +1 other test ( 1 fail, 1 pass )
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_oa@buffer-fill@rcs-0.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_oa@buffer-fill@rcs-0.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#2541] / [Intel XE#3573])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][398], [SKIP][399]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test ( 2 skip )
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][400] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> ([SKIP][401], [SKIP][402]) ([Intel XE#2427])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@xe_peer2peer@write.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][403] ([Intel XE#2284] / [Intel XE#366])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][404] ([Intel XE#2284])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][405] ([Intel XE#2284])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][406] ([Intel XE#584])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][407] -> ([PASS][408], [ABORT][409]) ([Intel XE#1794])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_pm@s4-basic.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#944])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> ([SKIP][412], [SKIP][413]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][414], [SKIP][415]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][416] ([Intel XE#944]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#4130])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#4130])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-lnl:          NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#4130])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> ([SKIP][423], [SKIP][424]) ([Intel XE#4273])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          NOTRUN -> [SKIP][425] ([Intel XE#4351])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2191]) -> ([PASS][427], [PASS][428])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][429] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][431] ([Intel XE#3862]) -> ([PASS][432], [PASS][433]) +1 other test ( 2 pass )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][434] ([Intel XE#2291]) -> ([PASS][435], [PASS][436]) +2 other tests ( 2 pass )
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#309]) -> ([PASS][438], [PASS][439]) +1 other test ( 2 pass )
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#309]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][442] ([Intel XE#2291]) -> [PASS][443] +1 other test pass
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [INCOMPLETE][444] ([Intel XE#3226]) -> [PASS][445] +1 other test pass
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][446] ([Intel XE#3009]) -> ([PASS][447], [PASS][448])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_dp_aux_dev.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#702]) -> ([PASS][450], [PASS][451])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_feature_discovery@display-2x.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][452] ([Intel XE#2316]) -> ([PASS][453], [PASS][454]) +5 other tests ( 2 pass )
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][455] ([Intel XE#301]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][457] ([Intel XE#2316]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#310]) -> ([PASS][460], [PASS][461]) +6 other tests ( 2 pass )
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][462] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][463]
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][464] ([Intel XE#4543]) -> [PASS][465]
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#656]) -> ([PASS][467], [PASS][468])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#656]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][471] ([Intel XE#1503]) -> ([PASS][472], [PASS][473]) +1 other test ( 2 pass )
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-adlp:         [DMESG-WARN][474] ([Intel XE#4173]) -> [PASS][475] +1 other test pass
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#4596]) -> ([PASS][477], [PASS][478])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-4.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#836]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][481] ([Intel XE#1435]) -> ([PASS][482], [PASS][483])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][484] ([Intel XE#1499]) -> [PASS][485]
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:
    - shard-dg2-set2:     [INCOMPLETE][486] -> ([PASS][487], [PASS][488]) +1 other test ( 2 pass )
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1392]) -> ([PASS][490], [PASS][491]) +1 other test ( 2 pass )
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][492] ([Intel XE#4541]) -> ([PASS][493], [PASS][494])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@xe_oa@buffer-size.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_oa@buffer-size.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#787]) -> ([SKIP][496], [SKIP][497]) ([Intel XE#455] / [Intel XE#787]) +14 other tests ( 2 skip )
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#787]) -> [SKIP][499] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][500] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][501], [INCOMPLETE][502]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test ( 1 incomplete, 1 pass )
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][504] ([Intel XE#787]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][505] ([Intel XE#4132]) -> ([SKIP][506], [FAIL][507]) ([Intel XE#1178] / [Intel XE#2341])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_content_protection@atomic.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][508] ([Intel XE#4132]) -> [FAIL][509] ([Intel XE#1178])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][510] ([Intel XE#1178]) -> ([SKIP][511], [FAIL][512]) ([Intel XE#1178] / [Intel XE#2341])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_content_protection@legacy.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_content_protection@legacy.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][513] ([Intel XE#2341]) -> ([SKIP][514], [FAIL][515]) ([Intel XE#1178] / [Intel XE#2341])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [INCOMPLETE][516] ([Intel XE#4132]) -> ([SKIP][517], [SKIP][518]) ([Intel XE#455])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_content_protection@srm.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#309]) -> ([PASS][520], [SKIP][521]) ([Intel XE#309])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][522] ([Intel XE#301]) -> ([FAIL][523], [SKIP][524]) ([Intel XE#301] / [Intel XE#310])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][525] ([Intel XE#2316]) -> [FAIL][526] ([Intel XE#3321])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][527] ([Intel XE#301]) -> [SKIP][528] ([Intel XE#310])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][529] -> [TIMEOUT][530] ([Intel XE#1504]) +1 other test timeout
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][531] ([Intel XE#4543]) -> [DMESG-FAIL][532] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#651]) -> ([SKIP][534], [SKIP][535]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][536] ([Intel XE#2312]) -> ([SKIP][537], [SKIP][538]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#656]) -> [SKIP][540] ([Intel XE#651])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][541] ([Intel XE#2312]) -> ([SKIP][542], [SKIP][543]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][544] ([Intel XE#2311]) -> [SKIP][545] ([Intel XE#2312]) +4 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][546] ([Intel XE#2311]) -> ([SKIP][547], [SKIP][548]) ([Intel XE#2311] / [Intel XE#2312]) +12 other tests ( 2 skip )
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#651]) -> ([SKIP][550], [SKIP][551]) ([Intel XE#651] / [Intel XE#656]) +20 other tests ( 2 skip )
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][552] ([Intel XE#4141]) -> ([SKIP][553], [SKIP][554]) ([Intel XE#2312] / [Intel XE#4141]) +9 other tests ( 2 skip )
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][555] ([Intel XE#4141]) -> [SKIP][556] ([Intel XE#2312])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][557] ([Intel XE#2312]) -> [SKIP][558] ([Intel XE#4141]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][559] ([Intel XE#2312]) -> ([SKIP][560], [SKIP][561]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][562] ([Intel XE#2312]) -> ([SKIP][563], [SKIP][564]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#651]) -> [SKIP][566] ([Intel XE#656]) +4 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][567] ([Intel XE#2312]) -> [SKIP][568] ([Intel XE#2311]) +4 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#656]) -> ([SKIP][570], [SKIP][571]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#656]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#651] / [Intel XE#656])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][575] ([Intel XE#2312]) -> ([SKIP][576], [SKIP][577]) ([Intel XE#2313]) +12 other tests ( 2 skip )
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#653]) -> [SKIP][579] ([Intel XE#656]) +4 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][580] ([Intel XE#2312]) -> [SKIP][581] ([Intel XE#2313]) +5 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][582] ([Intel XE#2313]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#2312])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][585] ([Intel XE#2313]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#656]) -> [SKIP][589] ([Intel XE#653]) +2 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#656]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#653]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#656]) +1 other test ( 2 skip )
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#656]) -> ([SKIP][597], [SKIP][598]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][599] ([Intel XE#2312]) -> ([SKIP][600], [SKIP][601]) ([Intel XE#2312] / [Intel XE#2313])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][602] ([Intel XE#2313]) -> [SKIP][603] ([Intel XE#2312]) +5 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#653]) -> ([SKIP][605], [SKIP][606]) ([Intel XE#653] / [Intel XE#656]) +15 other tests ( 2 skip )
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][607] ([Intel XE#3012]) -> ([PASS][608], [SKIP][609]) ([Intel XE#3012])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][610] ([Intel XE#2493]) -> ([SKIP][611], [SKIP][612]) ([Intel XE#2493] / [Intel XE#4596])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#455]) -> ([SKIP][614], [SKIP][615]) ([Intel XE#455] / [Intel XE#4596])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][616] ([Intel XE#4596]) -> ([SKIP][617], [SKIP][618]) ([Intel XE#2493])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#4596]) -> ([SKIP][620], [SKIP][621]) ([Intel XE#455])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][622] ([Intel XE#2705] / [Intel XE#4540]) -> ([ABORT][623], [ABORT][624]) ([Intel XE#4540])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][625] ([Intel XE#4502] / [Intel XE#4540]) -> [ABORT][626] ([Intel XE#4540])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][627] ([Intel XE#718]) -> ([PASS][628], [FAIL][629]) ([Intel XE#718])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][630] ([Intel XE#2029]) -> ([PASS][631], [FAIL][632]) ([Intel XE#2029])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][633] ([Intel XE#1729]) -> ([FAIL][634], [SKIP][635]) ([Intel XE#1729] / [Intel XE#362])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#1500]) -> [SKIP][637] ([Intel XE#362])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][638] ([Intel XE#771]) -> ([FAIL][639], [FAIL][640]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][641] ([Intel XE#771]) -> ([FAIL][642], [PASS][643]) ([Intel XE#899])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-lnl:          [ABORT][644] ([Intel XE#4623]) -> ([PASS][645], [ABORT][646]) ([Intel XE#4623])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][647] ([Intel XE#1173]) -> ([SKIP][648], [FAIL][649]) ([Intel XE#1061] / [Intel XE#1173])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@xe_peer2peer@write.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_peer2peer@write.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][650] ([Intel XE#1794]) -> ([PASS][651], [ABORT][652]) ([Intel XE#1794])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
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
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
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
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
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
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
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
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * IGT: IGT_8292 -> IGTPW_12877
  * Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -> xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda

  IGTPW_12877: 12877
  IGT_8292: 8292
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811d8f3f249392c5ceda

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/index.html

--===============7577154045456147523==
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
<tr><td><b>Series:</b></td><td>Fault variations of tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146949/">https://patchwork.freedesktop.org/series/146949/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12877/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8292_FULL -&gt; XEIGTPW_12877_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12877_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12877_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
877_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-=
crc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877=
/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/i=
gt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_vblank@ts-continuation-sus=
pend@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@basic-vm-access-faultable} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_eudebug@basic-vm-access-fault=
able.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@vm-bind-clear-faultable} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-fault=
able.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@vma-ufence-faultable} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultable.=
html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@srm:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html">INCOMPLETE</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sha=
rd-bmg-6/igt@kms_content_protection@srm.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_content_p=
rotection@srm.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 1 fail, 1=
 incomplete )</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8292_FULL and XEIGTPW_12877=
_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12877_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-=
1/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-o=
verflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-o=
verflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
10">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12877/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotat=
e-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displ=
ays-2160x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-dis=
plays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@bad-aux-stride=
-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +52 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +169 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +4 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +=
1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_chamelium_color@degamma.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>=
) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2877/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-afte=
r-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12877/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernat=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#=
2252</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12877/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_content_protection@dp-mst-l=
ic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12877/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen=
-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_crc@cursor-random-51=
2x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-5=
12x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-at=
omic-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb=
-atomic-transitions.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-tog=
gle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-leg=
acy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#15=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-ms=
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
7/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/i=
gt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +7 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
877/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-=
3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_fbcon_fbt@fbc-sus=
pend.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4164">Intel XE#4164</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-b=
mg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard=
-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_feature_discovery@psr2.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
7/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
877/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-lnl-5/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a hr=
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
GTPW_12877/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2877/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank-interr=
uptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modes=
et-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +7 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bm=
g-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-flip-=
vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-=
hang.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
">Intel XE#310</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sha=
rd-bmg-7/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">INCOMPLETE</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@bd=
-hdmi-a2-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-=
race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-=
bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877=
/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms=
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
TPW_12877/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"=
>Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +5 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8=
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
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2=
-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@fl=
ip-vs-suspend.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1=
 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi=
-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/s=
hard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@k=
ms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">In=
tel XE#2380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-va=
lid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2293">Intel XE#2293</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip_scaled_crc@fl=
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
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-x-to-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-d-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +=
13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests ( =
1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE=
#4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitla=
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
ee/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +=
5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-3/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other te=
st ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"=
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
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/=
igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-=
bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_hdr@stati=
c-toggle-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_invalid_mode@clock-too-high=
@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_invalid_mode@clock-too-high=
@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-=
bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_plane_scaling@planes-unity-=
scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_plane_scaling=
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
g/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel =
XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sha=
rd-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">=
Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877=
/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Int=
el XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-ov=
erlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-upd=
ate-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/289=
3">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-up=
date-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
7/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
877/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_psr@pr-basic.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-=
dg2-433/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_psr@pr-cursor-render.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/=
shard-lnl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr@psr2-no-drrs.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shar=
d-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>=
) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@k=
ms_setmode@basic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_setmode@basic.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shar=
d-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12877/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-=
5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-46=
4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_writeback@writeback-check-o=
utput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-bmg-3/igt@kms_writeback@writeback-check-output.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_writeback@writeback-fb-id-=
xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-=
0xfd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">I=
ntel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extend=
ed.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-si=
gint-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-vm-dest=
roy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_online@interrupt-o=
ther-debuggable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-d=
ebuggable.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_eudebug_online@resume-one.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
877/shard-bmg-1/igt@xe_eudebug_online@resume-one.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_online@single-step-=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2877/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_evict@evict-large-external.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2877/shard-lnl-4/igt@xe_evict@evict-large-external.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel =
XE#2322</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-=
mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_exec_basic@multi=
gpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 =
other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_exec_fault_mode@once-userp=
tr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12877/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-=
invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_fault_mode@twice-binde=
xecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebin=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@xe_oa@buffer-fill@rcs-0.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/=
igt@xe_oa@buffer-fill@rcs-0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_oa@buffer-fill@rcs-0.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4565">Intel XE#4565</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-dg2-464/igt@xe_oa@mmio-triggered-reports.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
7/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4501">Intel XE#4501</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-=
bmg-6/igt@xe_peer2peer@write.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Int=
el XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12877/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycl=
es.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_sriov_auto_=
provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-bmg-6/igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
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
01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linear-=
tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_bw@connected-linea=
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
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_bw@connecte=
d-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
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
tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +1 other test (=
 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_le=
gacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-b=
mg-1/igt@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Inte=
l XE#702</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-463/igt@kms_feature_discovery@display-2x.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-d=
g2-432/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-o=
ff-vs-modeset-interruptible.html">PASS</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>) +6 other tests ( 2 pass )</li>
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip@fl=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_flip_tiling@=
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
.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/=
shard-bmg-6/igt@kms_hdr@static-toggle.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_hdr@static-=
toggle.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12877/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-un=
tiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2=
-435/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-st=
ealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
7/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xma=
jor-compressed-compfmt0-vram01-vram01-451x451.html">INCOMPLETE</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-4=
35/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@xe_ccs@block-copy-compresse=
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
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@xe=
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
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shar=
d-bmg-8/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@xe_oa@buffer-size.html"=
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
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@bad-rotati=
on-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +14 other tests ( 2 skip )</li>
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
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +4 other tests skip</li>
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
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12877/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-h=
dmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 =
other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@kms_ccs=
@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">In=
tel XE#4132</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12877/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg=
-6/igt@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gi=
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
ree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_content_protection@atomic@pipe=
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
#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12877/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt=
@kms_content_protection@legacy.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-b=
mg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Int=
el XE#4132</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-4=
64/igt@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">In=
tel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12877/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TI=
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-adlp-8/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"=
>Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-43=
3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/651">Intel XE#651</a>) +6 other tests ( 2 skip )</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-432/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-466/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-1/igt@kms_frontbuffer_track=
ing@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-463/igt@kms_=
frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12877/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12877/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
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
PW_12877/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-4/i=
gt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a=
>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12877/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-4=
64/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://g=
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
XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12877/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-bmg-6=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12877/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-d=
g2-432/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"http=
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
1.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_scaling@intel-m=
ax-src-size.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.h=
tml">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4540">Intel XE#4540</a>)</li>
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-433/igt@kms_plane_=
scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard=
-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/sh=
ard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@kms_pm_dc@deep-pkgc=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12877/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
77/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel =
XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12877/shard-dg2-464/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-l=
nl-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12877/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@=
pipe-b-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12877/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-=
b-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-8/igt@xe_fault_inje=
ction@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-7/igt=
@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">A=
BORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
623">Intel XE#4623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@xe_peer2peer@write.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/s=
hard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-dg2-435/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12877/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12877/shard-lnl-2/igt@x=
e_pm@s4-vm-bind-unbind-all.html">ABORT</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8292 -&gt; IGTPW_12877</li>
<li>Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -&gt; xe-2876-e=
b7714c3b05163fd19bc811d8f3f249392c5ceda</li>
</ul>
<p>IGTPW_12877: 12877<br />
  IGT_8292: 8292<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54=
a9f4f34d476d2f3d7<br />
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811=
d8f3f249392c5ceda</p>

</body>
</html>

--===============7577154045456147523==--
