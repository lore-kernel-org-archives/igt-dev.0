Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5702ECA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 21:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4F10E033;
	Thu,  1 Oct 2026 21:02:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC4110E033;
 Thu,  1 Oct 2026 21:02:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8359098064079427938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Expand_kms=5Fdp=5Flink=5Ft?=
 =?utf-8?q?raining_coverage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Oct 2026 21:02:08 -0000
Message-ID: <179088852862.230684.2124293926577189013@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

--===============8359098064079427938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expand kms_dp_link_training coverage (rev2)
URL   : https://patchwork.freedesktop.org/series/174224/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9121_FULL -> XEIGTPW_15930_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15930_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15930_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15930_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train (NEW):
    - shard-ptl:          NOTRUN -> [SKIP][1] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][3] +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  
#### Warnings ####

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-ptl:          [SKIP][4] ([Intel XE#5882]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-4/igt@kms_dp_link_training@non-uhbr-mst.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-lnl:          [SKIP][6] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          [SKIP][8] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][10] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-ptl:          [SKIP][12] ([Intel XE#7386]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@kms_dp_link_training@uhbr-mst.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-ptl:          [SKIP][14] ([Intel XE#5870]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-3/igt@kms_dp_link_training@uhbr-sst.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_dp_link_training@uhbr-sst.html
    - shard-lnl:          [SKIP][16] ([Intel XE#4354] / [Intel XE#5870]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html

  
New tests
---------

  New tests have been introduced between XEIGT_9121_FULL and XEIGTPW_15930_FULL:

### New IGT tests (26) ###

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.01, 65.72] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.54] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.27] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.24] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.26] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.26] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.25] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.26] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.25] s

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.25] s

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.51] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.28] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.27] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.28] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.25] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.26] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x162000:
    - Statuses : 1 pass(s)
    - Exec time: [7.28] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x270000:
    - Statuses : 1 pass(s)
    - Exec time: [7.28] s

  * igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x540000:
    - Statuses : 1 pass(s)
    - Exec time: [7.26] s

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.09] s

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15930_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-ptl:          [PASS][18] -> [ABORT][19] ([Intel XE#9387]) +1 other test abort
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-4/igt@kms_async_flips@async-flip-suspend-resume.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#8098]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5901]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7059] / [Intel XE#7085])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7059] / [Intel XE#7085])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5808]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7679])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7679])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5822]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][36] -> [ABORT][37] ([Intel XE#9406] / [Intel XE#9422]) +1 other test abort
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2652]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#306] / [Intel XE#7358])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_chamelium_color@degamma.html
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5824])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#8391]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7358]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#9333]) +20 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4:
    - shard-ptl:          NOTRUN -> [FAIL][51] ([Intel XE#9333]) +20 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:
    - shard-lnl:          NOTRUN -> [FAIL][52] ([Intel XE#9333]) +15 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6969]) +15 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#6969]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2390] / [Intel XE#6974])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7642])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7642])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#6707] / [Intel XE#7439])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5846]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2320]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1424])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321] / [Intel XE#7355]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#5900]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-ptl:          [PASS][65] -> [ABORT][66] ([Intel XE#9375]) +1 other test abort
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5962]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5962] / [Intel XE#7343])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#323] / [Intel XE#6035])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5907]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8265]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4422] / [Intel XE#7442])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7359])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#9365])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][78] ([Intel XE#9365])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7178]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7178] / [Intel XE#7349])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7179])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5828]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7178] / [Intel XE#7351])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6312]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2352] / [Intel XE#7399])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#6312]) +10 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6312] / [Intel XE#651])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#5800] / [Intel XE#6312]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2311]) +54 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7905]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#5812]) +37 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7865]) +10 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#7061]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +38 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#7061]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#7865]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#9312])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [PASS][104] -> [SKIP][105] ([Intel XE#7308])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#7308])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          [PASS][108] -> [ABORT][109] ([Intel XE#9362] / [Intel XE#9438]) +1 other test abort
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5917] / [Intel XE#6174])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#3374] / [Intel XE#3544])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#6901])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#6911] / [Intel XE#7378])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#6900])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#8348])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#8303]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#7283])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7283]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#7283]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          NOTRUN -> [ABORT][121] ([Intel XE#9362]) +1 other test abort
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5879] / [Intel XE#7343])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#6886]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#8396]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#8396]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8854])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#5849]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#7304]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1489]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4608])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#4608] / [Intel XE#7304])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2893] / [Intel XE#7304])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#7413])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#7345])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-basic:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#1406]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#5813])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#3904] / [Intel XE#7342])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#5821])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:
    - shard-ptl:          [PASS][148] -> [ABORT][149] ([Intel XE#9362]) +8 other tests abort
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-7/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#6503]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#330] / [Intel XE#5857])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1499] / [Intel XE#9271])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2168] / [Intel XE#7444])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][156] -> [FAIL][157] ([Intel XE#7397]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][158] -> [ABORT][159] ([Intel XE#9362]) +1 other test abort
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#8370])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_evict@evict-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#5764]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#6144])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][164] ([Intel XE#7482]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#7482]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1392]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][168] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][169] ([Intel XE#8374]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#8374]) +11 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#8374])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - shard-ptl:          NOTRUN -> [SKIP][172] ([Intel XE#8364]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#8364]) +19 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#8364]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#8369])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#8369])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_exec_reset@multi-queue-gt-reset.html
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8369]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#8378]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#8378]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2833])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_madvise@atomic-device:
    - shard-ptl:          NOTRUN -> [SKIP][182] ([Intel XE#7980])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_madvise@atomic-device.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#560] / [Intel XE#7321] / [Intel XE#7453])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-ptl:          NOTRUN -> [SKIP][184] ([Intel XE#5100] / [Intel XE#7408])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#6964])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#6964])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-ptl:          NOTRUN -> [SKIP][187] ([Intel XE#6964])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-ptl:          [PASS][188] -> [FAIL][189] ([Intel XE#7334]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-2/igt@xe_oa@non-zero-reason-all.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][190] ([Intel XE#6069])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#7793])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#7793])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@xe_page_reclaim@binds-null-vma.html
    - shard-ptl:          NOTRUN -> [SKIP][193] ([Intel XE#7793])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#7590])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-ptl:          NOTRUN -> [SKIP][196] ([Intel XE#7590])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][200] ([Intel XE#6867])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-ptl:          [PASS][201] -> [DMESG-WARN][202] ([Intel XE#7727])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][203] -> [ABORT][204] ([Intel XE#9362]) +1 other test abort
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#8815])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-ptl:          NOTRUN -> [SKIP][207] ([Intel XE#7599])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#4733] / [Intel XE#7417])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-ptl:          NOTRUN -> [SKIP][209] ([Intel XE#6019])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][210] ([Intel XE#8963])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][211] ([Intel XE#3321]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][213] ([Intel XE#301]) -> [PASS][214] +4 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][215] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [ABORT][217] -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [ABORT][219] ([Intel XE#9362]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@xe_pm@s4-mocs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          [ABORT][221] ([Intel XE#9399]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][223] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][224] ([Intel XE#2509] / [Intel XE#7437])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#9406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406
  [Intel XE#9422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
  [Intel XE#9438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438


Build changes
-------------

  * IGT: IGT_9121 -> IGTPW_15930
  * Linux: xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc -> xe-5865-48433f4760819252dafd6bf71d1c0e4f38415842

  IGTPW_15930: 9873e2abea225a0c9a198debd4f4cf7405c9a838 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc: 51138a2c4ef84875e3d265c02cf7ebc28de216fc
  xe-5865-48433f4760819252dafd6bf71d1c0e4f38415842: 48433f4760819252dafd6bf71d1c0e4f38415842

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/index.html

--===============8359098064079427938==
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
<tr><td><b>Series:</b></td><td>Expand kms_dp_link_training coverage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174224/">https://patchwork.freedesktop.org/series/174224/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9121_FULL -&gt; XEIGTPW_15930_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15930_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15930_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15930_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train (NEW):</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9121_FULL and XEIGTPW_15930_FULL:</p>
<h3>New IGT tests (26)</h3>
<ul>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.01, 65.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-1x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-2x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train@dp-1-4x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-1x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-2x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x162000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x270000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst@dp-2-4x540000:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15930_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-4/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387">Intel XE#9387</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406">Intel XE#9406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422">Intel XE#9422</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-a-plane-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438">Intel XE#9438</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879">Intel XE#5879</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-7/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_madvise@atomic-device.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@xe_mmap@pci-membarrier-bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-2/igt@xe_oa@non-zero-reason-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069">Intel XE#6069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-3/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-6/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-4/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-10/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-7/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-8/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-8/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-ptl-5/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-ptl-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-5/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9121/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15930/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9121 -&gt; IGTPW_15930</li>
<li>Linux: xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc -&gt; xe-5865-48433f4760819252dafd6bf71d1c0e4f38415842</li>
</ul>
<p>IGTPW_15930: 9873e2abea225a0c9a198debd4f4cf7405c9a838 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc: 51138a2c4ef84875e3d265c02cf7ebc28de216fc<br />
  xe-5865-48433f4760819252dafd6bf71d1c0e4f38415842: 48433f4760819252dafd6bf71d1c0e4f38415842</p>

</body>
</html>

--===============8359098064079427938==--
