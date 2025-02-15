Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F1DC021A0
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 12:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36C10E059;
	Sat, 15 Feb 2025 12:03:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDD710E059;
 Sat, 15 Feb 2025 12:03:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4661603872055670025=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Ensure_that_SR-IOV_and_eud?=
 =?utf-8?q?ebug_are_exclusive_for_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 15 Feb 2025 12:03:22 -0000
Message-ID: <173962100203.2510870.4588166047039930692@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214124643.20908-1-christoph.manszewski@intel.com>
In-Reply-To: <20250214124643.20908-1-christoph.manszewski@intel.com>
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

--===============4661603872055670025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ensure that SR-IOV and eudebug are exclusive for Xe
URL   : https://patchwork.freedesktop.org/series/144864/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8230_full -> XEIGTPW_12598_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12598_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12598_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12598_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_plane_lowres@tiling-x.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html

  * {igt@xe_eudebug@deny-sriov} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_eudebug@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_eudebug@deny-sriov.html
    - shard-lnl:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@xe_eudebug@deny-sriov.html

  
#### Warnings ####

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          [ABORT][13] ([Intel XE#4268]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pipe_stress@stress-xrgb8888-ytiled}:
    - shard-bmg:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  
New tests
---------

  New tests have been introduced between XEIGT_8230_full and XEIGTPW_12598_full:

### New IGT tests (2) ###

  * igt@xe_eudebug@deny-eudebug:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_eudebug@deny-sriov:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12598_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3157])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#3767]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#873])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#873])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#873])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1407]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2327]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#607])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#607])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1477])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +14 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1124]) +16 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2191]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2191])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1512]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#367]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#367]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2669]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +190 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2907])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +16 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#3442])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#3432])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3432])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +16 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#3124] / [Intel XE#4010])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][56] ([Intel XE#1727] / [Intel XE#3113])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455] / [Intel XE#787]) +51 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2252]) +15 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#373]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1178])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#307])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2390])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#1178]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#1188]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_content_protection@uevent.html
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#3278]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#1188]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1424]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#309]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2291]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#309])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#309]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][77] ([Intel XE#877])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#323])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#323])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2286])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_dsc@dsc-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2244])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#776])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#776])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2374])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2316]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][88] ([Intel XE#3321]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#301]) +8 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#3321]) +3 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1421]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][93] ([Intel XE#2955])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#310]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_flip@2x-nonexisting-fb.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#310]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2316]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][98] -> [DMESG-WARN][99] ([Intel XE#2955]) +1 other test dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][100] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#2955])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#4172]) +32 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#886]) +2 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][107] -> [DMESG-WARN][108] ([Intel XE#1033]) +64 other tests dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1397]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#455]) +17 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1401]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2293]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#352])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2311]) +24 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#651]) +13 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#656]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2312]) +8 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#656]) +40 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4141]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#651]) +27 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#656]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2313]) +22 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#653]) +23 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1470] / [Intel XE#2853])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1503]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2934])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2925])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2934])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#346])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#346])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#346])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2486]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][137] ([Intel XE#616]) +3 other tests fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [PASS][138] -> [DMESG-WARN][139] ([Intel XE#4091])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][140] ([Intel XE#4172]) +35 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#3307])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][142] ([Intel XE#4212])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#2763]) +27 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2763]) +9 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2763]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#870]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_pm_backlight@fade.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#870]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2391])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1122]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#736])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#3309])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1439] / [Intel XE#3141])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][155] ([Intel XE#1033] / [Intel XE#2042])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#1489]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1489]) +8 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#2893]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2387])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1128])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1406]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3414]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2413])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2413] / [Intel XE#374])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#374]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][170] -> [FAIL][171] ([Intel XE#2883]) +2 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_setmode@basic.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1435])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1435]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2426])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#362])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#362])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#330])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2450])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][179] ([Intel XE#899]) +3 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][180] ([Intel XE#2159]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1447])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2905]) +12 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#2905]) +13 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2905]) +8 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#688]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2322]) +9 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][187] -> [SKIP][188] ([Intel XE#1392]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1392]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#1392]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#288]) +27 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2360]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#1192])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#2229])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][195] -> [SKIP][196] ([Intel XE#1192])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#512])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#1416])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2457])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#378])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#378])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#1337])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2284] / [Intel XE#366])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][205] -> [DMESG-WARN][206] ([Intel XE#1033] / [Intel XE#569]) +1 other test dmesg-warn
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
    - shard-bmg:          [PASS][207] -> [DMESG-WARN][208] ([Intel XE#4172] / [Intel XE#569]) +1 other test dmesg-warn
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][209] ([Intel XE#1033] / [Intel XE#569])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][210] ([Intel XE#1033]) +69 other tests dmesg-warn
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#944]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#944]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#944]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#4130]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#4130])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#4130])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#3342])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][218] ([Intel XE#3075] / [Intel XE#3084])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][219] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][221] -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][223] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][225] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][227] ([Intel XE#2291]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#309]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#3009]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_dp_aux_dev.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][233] ([Intel XE#3321]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#310]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][237] ([Intel XE#2316]) -> [PASS][238] +5 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2-set2:     [DMESG-WARN][239] ([Intel XE#2955]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_flip@basic-flip-vs-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][241] ([Intel XE#886]) -> [PASS][242] +2 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][243] ([Intel XE#1033] / [Intel XE#2955]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [DMESG-WARN][245] -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#656]) -> [PASS][248] +5 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          [DMESG-WARN][249] ([Intel XE#4172]) -> [PASS][250] +34 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#3663] / [Intel XE#4016]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - shard-bmg:          [INCOMPLETE][253] ([Intel XE#3663]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][255] ([Intel XE#718]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [FAIL][257] ([Intel XE#3924]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vblank@query-busy-hang@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][259] ([Intel XE#1033]) -> [PASS][260] +38 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_vblank@query-busy-hang@pipe-d-dp-4.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_vblank@query-busy-hang@pipe-d-dp-4.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][261] ([Intel XE#1033] / [Intel XE#1473]) -> [PASS][262] +2 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@xe_evict@evict-large-multi-vm.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1392]) -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-lnl:          [FAIL][265] -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [INCOMPLETE][267] -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@xe_module_load@many-reload.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][269] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [DMESG-WARN][271] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#787]) -> [SKIP][274] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][276] ([Intel XE#787]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#1178]) -> [SKIP][278] ([Intel XE#455]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_content_protection@atomic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [FAIL][279] ([Intel XE#1178]) -> [DMESG-FAIL][280] ([Intel XE#4172]) +1 other test dmesg-fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [DMESG-WARN][281] ([Intel XE#1033]) -> [SKIP][282] ([Intel XE#309])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [DMESG-WARN][283] ([Intel XE#1033]) -> [SKIP][284] ([Intel XE#310])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][285] ([Intel XE#2316]) -> [FAIL][286] ([Intel XE#3321])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][287] ([Intel XE#301]) -> [SKIP][288] ([Intel XE#310])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [SKIP][289] ([Intel XE#2316]) -> [DMESG-WARN][290] ([Intel XE#4172])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#310]) -> [DMESG-WARN][292] ([Intel XE#1033]) +1 other test dmesg-warn
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][293] ([Intel XE#1033]) -> [FAIL][294] ([Intel XE#301])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][295] ([Intel XE#4172]) -> [FAIL][296] ([Intel XE#3321]) +1 other test fail
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][297] ([Intel XE#2311]) -> [SKIP][298] ([Intel XE#2312]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2311]) +12 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#651]) -> [SKIP][302] ([Intel XE#656]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [DMESG-WARN][303] ([Intel XE#1033]) -> [SKIP][304] ([Intel XE#656])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][305] ([Intel XE#4141]) -> [SKIP][306] ([Intel XE#2312]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#656]) -> [DMESG-WARN][308] ([Intel XE#1033])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#4141]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#656]) -> [SKIP][312] ([Intel XE#651]) +8 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][313] ([Intel XE#2312]) -> [SKIP][314] ([Intel XE#2313]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#653]) -> [SKIP][316] ([Intel XE#656]) +10 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][317] ([Intel XE#2313]) -> [SKIP][318] ([Intel XE#2312]) +14 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#656]) -> [SKIP][320] ([Intel XE#653]) +7 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][321] ([Intel XE#4212]) -> [DMESG-WARN][322] ([Intel XE#2705] / [Intel XE#4212])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][323] ([Intel XE#1430]) -> [DMESG-FAIL][324] ([Intel XE#4172])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#836]) -> [DMESG-WARN][326] ([Intel XE#1033])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][327] ([Intel XE#2426]) -> [SKIP][328] ([Intel XE#2509])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [ABORT][329] ([Intel XE#1033] / [Intel XE#4268]) -> [ABORT][330] ([Intel XE#4268])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@xe_pm@s4-mocs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][331] ([Intel XE#4268]) -> [ABORT][332] ([Intel XE#1033] / [Intel XE#4268])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-bmg:          [ABORT][333] ([Intel XE#4268]) -> [ABORT][334] ([Intel XE#4172] / [Intel XE#4268])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016
  [Intel XE#4091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4091
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8230 -> IGTPW_12598

  IGTPW_12598: a216c621ed3a332d63cfdc3f0463f3df29f4735c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8230: 8230
  xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/index.html

--===============4661603872055670025==
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
<tr><td><b>Series:</b></td><td>Ensure that SR-IOV and eudebug are exclusive for Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144864/">https://patchwork.freedesktop.org/series/144864/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8230_full -&gt; XEIGTPW_12598_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12598_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12598_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12598_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_plane_lowres@tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@deny-sriov} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_eudebug@deny-sriov.html">SKIP</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_eudebug@deny-sriov.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@xe_eudebug@deny-sriov.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s4-d3hot-basic-exec:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pipe_stress@stress-xrgb8888-ytiled}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8230_full and XEIGTPW_12598_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_eudebug@deny-eudebug:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@deny-sriov:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12598_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +190 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible@d-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +32 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +64 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_plane_lowres@tiling-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4091">Intel XE#4091</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +35 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-6/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +69 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016">Intel XE#4016</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_vblank@query-busy-hang@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_vblank@query-busy-hang@pipe-d-dp-4.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@xe_evict@evict-large-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@xe_evict@evict-large-multi-vm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-lnl-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-lnl-3/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@xe_module_load@many-reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_flip@2x-plain-flip-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-433/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12598/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8230 -&gt; IGTPW_12598</li>
</ul>
<p>IGTPW_12598: a216c621ed3a332d63cfdc3f0463f3df29f4735c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8230: 8230<br />
  xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9</p>

</body>
</html>

--===============4661603872055670025==--
