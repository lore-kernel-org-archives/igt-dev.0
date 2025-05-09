Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD1AC3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 03:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDAF10E28D;
	Fri,  9 May 2025 03:39:51 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F4610E28D;
 Fri,  9 May 2025 03:39:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9161632167216936242=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/sec=5Fxe=5Fexe?=
 =?utf-8?q?c=5Fqueue=5Ftimeslice=5Fabuse=3A_Validate_the_Impact_of_Timeslice?=
 =?utf-8?q?_Abuse_on_Exec_Queues_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 May 2025 03:39:50 -0000
Message-ID: <174676199038.61300.2485891886192652880@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507104111.446923-1-peter.senna@linux.intel.com>
In-Reply-To: <20250507104111.446923-1-peter.senna@linux.intel.com>
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

--===============9161632167216936242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/sec_xe_exec_queue_timeslice_abuse: Validate the Impact of Timeslice Abuse on Exec Queues (rev4)
URL   : https://patchwork.freedesktop.org/series/148581/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8357_FULL -> XEIGTPW_13095_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13095_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13095_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13095_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-lnl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][3] -> ([PASS][4], [ABORT][5]) +1 other test ( 1 abort, 1 pass )
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][6] -> ([FAIL][7], [FAIL][8])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-lnl:          NOTRUN -> ([ABORT][9], [ABORT][10])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  
#### Warnings ####

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][11] -> ([SKIP][12], [SKIP][13]) ([Intel XE#4596])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  
New tests
---------

  New tests have been introduced between XEIGT_8357_FULL and XEIGTPW_13095_FULL:

### New IGT tests (5) ###

  * igt@xe_sec_exec_queue_timeslice@get-xe-exec-queue-timeslice-properties:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-boundary-value-analysis:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-equivalence-partitioning:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-fuzzing:
    - Statuses : 6 pass(s)
    - Exec time: [4.32, 4.71] s

  * igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-fuzzing-stress-test:
    - Statuses : 6 pass(s)
    - Exec time: [29.16, 49.67] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13095_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][14] -> ([FAIL][15], [PASS][16]) ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][17], [PASS][18]) ([Intel XE#827])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][19], [SKIP][20]) ([Intel XE#3767]) +7 other tests ( 2 skip )
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#3768])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> ([SKIP][23], [SKIP][24]) ([Intel XE#3279])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1407])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#316])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#316]) +2 other tests ( 2 skip )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#1407])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#2327])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#607])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#1124]) +6 other tests ( 2 skip )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1124])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#1124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][43] -> ([PASS][44], [SKIP][45]) ([Intel XE#2314] / [Intel XE#2894])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2314] / [Intel XE#2894])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2191])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2191])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#367]) +1 other test ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#367])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#1512]) +1 other test ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#367])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2887])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#787]) +209 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#455] / [Intel XE#787]) +21 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#2887]) +4 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#2669]) +3 other tests ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#3442])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#2669] / [Intel XE#3433]) +3 other tests ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#3432]) +1 other test ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2887]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#2907])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#787]) +83 other tests ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][82] -> [INCOMPLETE][83] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#4417]) +3 other tests ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#306])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#306]) +1 other test ( 2 skip )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_chamelium_color@ctm-limited-range.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-bmg:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#2325])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#373]) +4 other tests ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#373])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#373])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][100] ([Intel XE#1178]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][101] ([Intel XE#1178]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][102], [SKIP][103]) ([Intel XE#307]) +1 other test ( 2 skip )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#3278])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][105], [FAIL][106]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][108], [FAIL][109]) ([Intel XE#1188])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][110], [SKIP][111]) ([Intel XE#308]) +1 other test ( 2 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#2320])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_cursor_crc@cursor-random-max-size.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1424])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#1424]) +2 other tests ( 2 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2320])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#2291]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][120] -> ([PASS][121], [SKIP][122]) ([Intel XE#2291]) +6 other tests ( 1 pass, 1 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2291]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][124] -> ([PASS][125], [FAIL][126]) ([Intel XE#1475])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][127] -> ([PASS][128], [FAIL][129]) ([Intel XE#4667])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4494])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#4354])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][133] -> ([PASS][134], [SKIP][135]) ([Intel XE#4354])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#4356])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#4422])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#4422])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#4422])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][145] -> [SKIP][146] ([Intel XE#2316]) +8 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> ([SKIP][147], [PASS][148]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][149] -> ([FAIL][150], [FAIL][151]) ([Intel XE#301])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][152], [FAIL][153]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][154], [FAIL][155]) ([Intel XE#301] / [Intel XE#3321])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][156], [PASS][157]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][158], [FAIL][159]) ([Intel XE#301]) +1 other test ( 2 fail )
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1421]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][161] -> ([SKIP][162], [PASS][163]) ([Intel XE#2316]) +6 other tests ( 1 pass, 1 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][164] -> ([PASS][165], [FAIL][166]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][167] -> ([PASS][168], [FAIL][169]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#301]) +3 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][172] -> ([FAIL][173], [FAIL][174]) ([Intel XE#301] / [Intel XE#3321])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][175] -> ([FAIL][176], [FAIL][177]) ([Intel XE#301])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][178] -> ([FAIL][179], [PASS][180]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][181] -> ([INCOMPLETE][182], [PASS][183]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][184] -> [FAIL][185] ([Intel XE#886]) +2 other tests fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][186], [SKIP][187]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][188], [SKIP][189]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#455]) +9 other tests ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#2293] / [Intel XE#2380])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2293])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#1397] / [Intel XE#1745])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#1397])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#1401] / [Intel XE#1745])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1401])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#352])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2311]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#2311] / [Intel XE#2312])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#651]) +23 other tests ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][211], [SKIP][212]) ([Intel XE#4141]) +3 other tests ( 2 skip )
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#651])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#651]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2312]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#656]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][217], [SKIP][218]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#2311]) +4 other tests ( 2 skip )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#2313]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][222], [SKIP][223]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#653]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#2313]) +4 other tests ( 2 skip )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#653]) +22 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#656]) +17 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#605])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#2340])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][235] -> [SKIP][236] ([Intel XE#1503])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-1/igt@kms_hdr@static-swap.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][237], [SKIP][238]) ([Intel XE#1503])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_hdr@static-toggle.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][239] -> ([SKIP][240], [PASS][241]) ([Intel XE#1503])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#2925])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#2927])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][246] ([Intel XE#616]) +2 other tests fail
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][247], [FAIL][248]) ([Intel XE#616]) +1 other test ( 2 fail )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_plane_cursor@viewport.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#599]) +3 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#599])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#309]) +2 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-lnl:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2763]) +15 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2763]) +8 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#2763] / [Intel XE#455]) +5 other tests ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][260] ([Intel XE#2763]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][261] -> [FAIL][262] ([Intel XE#718])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][263] -> ([FAIL][264], [FAIL][265]) ([Intel XE#718])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][266] ([Intel XE#2392])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#1129])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> ([FAIL][269], [FAIL][270]) ([Intel XE#2029])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> ([SKIP][271], [SKIP][272]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][273] ([Intel XE#2893])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][274], [SKIP][275]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#2893] / [Intel XE#4608])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][277] ([Intel XE#4608]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#1489])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> ([SKIP][279], [SKIP][280]) ([Intel XE#2893] / [Intel XE#4608])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([Intel XE#4608]) +1 other test ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2893])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#1489]) +5 other tests ( 2 skip )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][287] ([Intel XE#1128])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#2234] / [Intel XE#2850]) +4 other tests ( 2 skip )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#2850] / [Intel XE#929]) +10 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#1406])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#4609])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#1406]) +2 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#4609])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#2850] / [Intel XE#929])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][299] ([Intel XE#2234] / [Intel XE#2850])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([Intel XE#2414])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][302], [SKIP][303]) ([Intel XE#2939])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][304], [SKIP][305]) ([Intel XE#3414])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][306] ([Intel XE#3414] / [Intel XE#3904])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#2330]) +1 other test ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][309] ([Intel XE#1127])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#1127])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][312], [SKIP][313]) ([Intel XE#3414] / [Intel XE#3904])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][314] ([Intel XE#3414])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-lnl:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#3414] / [Intel XE#3904])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][317] -> ([DMESG-WARN][318], [PASS][319]) ([Intel XE#3428]) +6 other tests ( 1 dmesg-warn, 1 pass )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_sequence@get-idle.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_sequence@get-idle.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][320] ([Intel XE#1435])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][321] -> ([PASS][322], [DMESG-WARN][323]) ([Intel XE#4212])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#1499])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][326] ([Intel XE#2168])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][327], [SKIP][328]) ([Intel XE#2168])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_vrr@lobf.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#1499])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_vrr@lobf.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][331] -> [FAIL][332] ([Intel XE#2142]) +1 other test fail
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][333], [ABORT][334]) ([Intel XE#2705])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@testdisplay.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][335], [SKIP][336]) ([Intel XE#1123])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][337], [SKIP][338]) ([Intel XE#1126]) +1 other test ( 2 skip )
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][339], [SKIP][340]) ([Intel XE#4497])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][341], [SKIP][342]) ([Intel XE#4837]) +8 other tests ( 2 skip )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_eudebug@basic-close.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-lnl:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([Intel XE#4837]) +6 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_eudebug@basic-exec-queues.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#4837]) +1 other test ( 2 skip )
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_eudebug@read-metadata.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][347] ([Intel XE#4837]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][348] ([Intel XE#4518])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([Intel XE#688]) +1 other test ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][351], [SKIP][352]) ([Intel XE#1392])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#2322])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][355] -> ([SKIP][356], [PASS][357]) ([Intel XE#1392]) +12 other tests ( 1 pass, 1 skip )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> ([SKIP][358], [SKIP][359]) ([Intel XE#1392]) +3 other tests ( 2 skip )
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2322])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][361] ([Intel XE#288]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#288]) +18 other tests ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][364] ([Intel XE#4837]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][365], [SKIP][366]) ([Intel XE#4943]) +3 other tests ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][367] ([Intel XE#4943]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][368] ([Intel XE#4943]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][369] ([Intel XE#4915]) +16 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][370] -> [FAIL][371] ([Intel XE#4929])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][372], [SKIP][373]) ([Intel XE#4915]) +128 other tests ( 2 skip )
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#4943]) +13 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][376], [INCOMPLETE][377]) ([Intel XE#4911])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> ([SKIP][378], [SKIP][379]) ([Intel XE#4045])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@xe_mmap@pci-membarrier-parallel.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403]) -> ([PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [SKIP][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [SKIP][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452]) ([Intel XE#378])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-463/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-434/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-436/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-436/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-464/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-436/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-463/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-464/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-434/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-434/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> ([SKIP][453], [SKIP][454]) ([Intel XE#379])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_noexec_ping_pong.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][455], [SKIP][456]) ([Intel XE#2541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][457] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][458], [SKIP][459]) ([Intel XE#2838] / [Intel XE#979])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> ([SKIP][460], [SKIP][461]) ([Intel XE#979])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_pat@pat-index-xelpg.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> ([SKIP][462], [SKIP][463]) ([Intel XE#2284] / [Intel XE#366])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> ([SKIP][464], [SKIP][465]) ([Intel XE#2284])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][466], [SKIP][467]) ([Intel XE#2284])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][468] ([Intel XE#2284])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][469] -> ([PASS][470], [ABORT][471]) ([Intel XE#1794])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-1/igt@xe_pm@s4-basic.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_pm@s4-basic.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][472] -> [ABORT][473] ([Intel XE#1794])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][474], [SKIP][475]) ([Intel XE#584])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_pm_residency@cpg-basic.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          NOTRUN -> ([SKIP][476], [SKIP][477]) ([Intel XE#4650])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][478], [SKIP][479]) ([Intel XE#4733]) +2 other tests ( 2 skip )
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
    - shard-bmg:          NOTRUN -> ([SKIP][480], [SKIP][481]) ([Intel XE#4733])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][482], [SKIP][483]) ([Intel XE#944]) +1 other test ( 2 skip )
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_query@multigpu-query-config.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][484] ([Intel XE#944])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][485] ([Intel XE#944])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> ([SKIP][486], [SKIP][487]) ([Intel XE#944])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][488], [SKIP][489]) ([Intel XE#4814])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_render_copy@render-stress-4-copies.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> ([SKIP][490], [SKIP][491]) ([Intel XE#4273])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_vm@large-split-binds-4194304:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][492], [PASS][493]) ([Intel XE#3428]) +1 other test ( 1 dmesg-warn, 1 pass )
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_vm@large-split-binds-4194304.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@xe_vm@large-split-binds-4194304.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][494] ([Intel XE#911]) -> ([PASS][495], [PASS][496]) +3 other tests ( 2 pass )
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][497] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][498], [PASS][499])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][500] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][501], [PASS][502])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][503] ([Intel XE#3124]) -> [PASS][504]
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][505] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][506]
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][507] ([Intel XE#2291]) -> ([PASS][508], [PASS][509]) +4 other tests ( 2 pass )
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][510] ([Intel XE#4302]) -> ([PASS][511], [PASS][512])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [FAIL][513] ([Intel XE#4772]) -> ([PASS][514], [PASS][515])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [SKIP][516] ([Intel XE#2316]) -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][518] ([Intel XE#2316]) -> ([PASS][519], [PASS][520]) +2 other tests ( 2 pass )
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][521] ([Intel XE#301]) -> ([PASS][522], [PASS][523])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][524] ([Intel XE#886]) -> ([PASS][525], [PASS][526]) +2 other tests ( 2 pass )
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][527] ([Intel XE#2882]) -> ([PASS][528], [PASS][529]) +2 other tests ( 2 pass )
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][530] ([Intel XE#718]) -> ([PASS][531], [PASS][532])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][533] ([Intel XE#4459]) -> ([PASS][534], [PASS][535]) +1 other test ( 2 pass )
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1392]) -> ([PASS][537], [PASS][538]) +4 other tests ( 2 pass )
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [INCOMPLETE][539] -> ([PASS][540], [PASS][541])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][542] ([Intel XE#1794]) -> ([PASS][543], [PASS][544]) +1 other test ( 2 pass )
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][545] ([Intel XE#2341]) -> ([FAIL][546], [SKIP][547]) ([Intel XE#1178] / [Intel XE#2341]) +1 other test ( 1 fail, 1 skip )
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_content_protection@legacy.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_content_protection@legacy.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][548] ([Intel XE#2341]) -> ([FAIL][549], [FAIL][550]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_content_protection@srm.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_content_protection@srm.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][551] ([Intel XE#2341]) -> ([FAIL][552], [FAIL][553]) ([Intel XE#1188])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_content_protection@uevent.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_content_protection@uevent.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][554] ([Intel XE#2291]) -> ([PASS][555], [SKIP][556]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][557] ([Intel XE#2291]) -> ([DMESG-WARN][558], [PASS][559]) ([Intel XE#877])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][560] ([Intel XE#2316]) -> ([FAIL][561], [FAIL][562]) ([Intel XE#3321])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][563] ([Intel XE#2316]) -> ([SKIP][564], [PASS][565]) ([Intel XE#2316]) +7 other tests ( 1 pass, 1 skip )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][566] ([Intel XE#301]) -> ([PASS][567], [FAIL][568]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][569] ([Intel XE#301] / [Intel XE#3321]) -> ([PASS][570], [FAIL][571]) ([Intel XE#301] / [Intel XE#3321])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][572] ([Intel XE#2312]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#2311]) +12 other tests ( 2 skip )
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][575] ([Intel XE#2311]) -> [SKIP][576] ([Intel XE#2312]) +6 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][577] ([Intel XE#2312]) -> [SKIP][578] ([Intel XE#2311]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][579] ([Intel XE#2312]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#2311] / [Intel XE#2312]) +18 other tests ( 2 skip )
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][582] ([Intel XE#2312]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#2312] / [Intel XE#4141]) +7 other tests ( 2 skip )
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][585] ([Intel XE#4141]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][588] ([Intel XE#4141]) -> [SKIP][589] ([Intel XE#2312]) +1 other test skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][590] ([Intel XE#2312]) -> [SKIP][591] ([Intel XE#4141]) +1 other test skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][592] ([Intel XE#2312]) -> ([SKIP][593], [SKIP][594]) ([Intel XE#4141]) +10 other tests ( 2 skip )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][595] ([Intel XE#2311]) -> ([SKIP][596], [SKIP][597]) ([Intel XE#2311] / [Intel XE#2312]) +18 other tests ( 2 skip )
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][598] ([Intel XE#2311]) -> ([SKIP][599], [SKIP][600]) ([Intel XE#2312])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][601] ([Intel XE#2313]) -> [SKIP][602] ([Intel XE#2312]) +7 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][603] ([Intel XE#2312]) -> ([SKIP][604], [SKIP][605]) ([Intel XE#2313]) +11 other tests ( 2 skip )
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][606] ([Intel XE#2312]) -> [SKIP][607] ([Intel XE#2313]) +3 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][608] ([Intel XE#2312]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#2312] / [Intel XE#2313]) +21 other tests ( 2 skip )
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][611] ([Intel XE#2313]) -> ([SKIP][612], [SKIP][613]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][614] ([Intel XE#3012]) -> ([SKIP][615], [PASS][616]) ([Intel XE#3012]) +1 other test ( 1 pass, 1 skip )
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][617] ([Intel XE#4596]) -> ([SKIP][618], [PASS][619]) ([Intel XE#4596])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][620] ([Intel XE#2571]) -> ([SKIP][621], [PASS][622]) ([Intel XE#2571])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][623] ([Intel XE#1729]) -> ([SKIP][624], [FAIL][625]) ([Intel XE#1729] / [Intel XE#362])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][626] ([Intel XE#2426]) -> ([SKIP][627], [SKIP][628]) ([Intel XE#2426] / [Intel XE#2509])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#1392]) -> ([PASS][630], [SKIP][631]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][632] ([Intel XE#1173]) -> ([SKIP][633], [FAIL][634]) ([Intel XE#1061] / [Intel XE#1173])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_peer2peer@read.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_peer2peer@read.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4772
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8357 -> IGTPW_13095

  IGTPW_13095: 13095
  IGT_8357: 8357
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891b96226af17571b2a3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/index.html

--===============9161632167216936242==
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
<tr><td><b>Series:</b></td><td>tests/intel/sec_xe_exec_queue_timeslice_abus=
e: Validate the Impact of Timeslice Abuse on Exec Queues (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148581/">https://patchwork.freedesktop.org/series/148581/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13095/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8357_FULL -&gt; XEIGTPW_13095_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13095_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13095_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
095_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13095/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">ABOR=
T</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing=
@pipe-a-hdmi-a-6-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_setmode@invalid-clo=
ne-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</=
a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-new-bo-map-nomemset.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_exec_system_alloca=
tor@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@=
xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.h=
tml">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_fault_injection@inject-fault=
-probe-function-xe_wa_init.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_fault_injection@inject=
-fault-probe-function-xe_wa_init.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_multiple@2x-tiling-yf:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shar=
d-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_plane=
_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8357_FULL and XEIGTPW_13095=
_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_sec_exec_queue_timeslice@get-xe-exec-queue-timeslice-properties:<=
/p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-boundary-value-a=
nalysis:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-equivalence-part=
itioning:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-fuzzing:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [4.32, 4.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_sec_exec_queue_timeslice@xe-exec-queue-timeslice-fuzzing-stress-t=
est:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [29.16, 49.67] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13095_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_async_flips@alternate-sync-=
async-flip-atomic@pipe-d-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_async_flips@alterna=
te-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a=
-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt=
@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-m=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3767">Intel XE#3767</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13095/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-ato=
mic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_atomic_transition@plane-all=
-modeset-transition.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_atomic_transition@plane-all-m=
odeset-transition.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13095/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) +2 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13095/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Int=
el XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13095/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotat=
e-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13095/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotat=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13095/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13095/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x=
2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays=
-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>) +1 other test ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +209 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13095/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-r=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_ccs@ccs-on-ano=
ther-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_ccs@crc-primary-ro=
tation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +=
3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-t=
iled-lnl-ccs@pipe-a-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled=
-gen12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_ccs@crc=
-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +83 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_cdclk@mode-transition@pip=
e-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4417">Intel XE#4417</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_chamelium_color@ctm-limited=
-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
">Intel XE#306</a>) +1 other test ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_chamelium_color@ctm-limited=
-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
5">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-reso=
lution-list.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-lis=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-storm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with=
-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13095/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_content_protection@lic-type=
-0@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe=
-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_content_protection@uevent@p=
ipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/308">Intel XE#308</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_cursor_crc@cursor-random-ma=
x-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-5/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-mov=
ement-64x21.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x2=
1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1424">Intel XE#1424</a>) +2 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13095/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE=
#2291</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg=
-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg=
-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">I=
ntel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-dg2-433/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#=
4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-=
dirty-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race=
-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race-interr=
uptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1421">Intel XE#1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop=
-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interr=
uptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095=
/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/i=
gt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Inte=
l XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)=
 +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@bc-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/s=
hard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@k=
ms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other te=
sts ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-ln=
l-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_flip@blocking=
-wf_vblank.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/=
shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@k=
ms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other t=
est ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2=
-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel=
 XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6=
/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/s=
hard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel =
XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt=
@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)=
 +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1309=
5/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-=
4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_flip_sca=
led_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1745">Intel XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-=
4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-ln=
l-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downsca=
ling@pipe-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_flip_scale=
d_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip_scaled_crc@fl=
ip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_=
flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-=
linear-to-32bpp-linear-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_flip_scaled_cr=
c@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">In=
tel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-=
linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-6/ig=
t@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-=
default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_force_connector_basic@force=
-connector-state.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_force_connector_basic@force-conn=
ector-state.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@=
drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs=
-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) +23 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +=
3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-tiling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tili=
ng-linear.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_frontbuffer_track=
ing@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-1/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@k=
ms_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_hdr@static-toggle.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-lnl-6/igt@kms_hdr@static-toggle.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg=
-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_hdr@static-togg=
le-dpms.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/292=
5">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_plane_cursor@viewport.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) =
+1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095=
/shard-lnl-1/igt@kms_plane_lowres@tiling-4.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
99">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-mul=
ti-pipe.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13095/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
09">Intel XE#309</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_plane_scalin=
g@planes-downscale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_plane_scaling@planes-down=
scale-factor-0-25@pipe-a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_scaling@planes-d=
ownscale-factor-0-25@pipe-a.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_plane_sc=
aling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE=
#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-=
no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13095/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_psr2_sf@fbc-ps=
r2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move=
-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13095/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-a=
rea.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move=
-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-=
move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-up=
date-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13095/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
29">Intel XE#929</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13095/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove@edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13095/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_psr@psr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_psr@psr-primary-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@kms_rotation_crc@sprite-rotati=
on-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_sequence@get-idle.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/ig=
t@kms_sequence@get-idle.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_sequence@get-idle.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3428">Intel XE#3428</a>) +6 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing=
@pipe-b-hdmi-a-6-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@kms_setmode@invalid-clo=
ne-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-W=
ARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1309=
5/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-=
466/igt@kms_vrr@lobf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/=
igt@kms_vrr@lobf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@testdisplay.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-=
434/igt@testdisplay.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear=
-0x369.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
3">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-=
0xfd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">I=
ntel XE#1126</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_eu_stall@non-blocking-read=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-dg2-463/igt@xe_eu_stall@non-blocking-read.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#=
4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_eudebug@basic-close.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/=
shard-dg2-464/igt@xe_eudebug@basic-close.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +8 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_eudebug@basic-exec-queues.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_eudebug@read-metadata.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/=
shard-bmg-8/igt@xe_eudebug@read-metadata.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 o=
ther test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@xe_eudebug@vma-ufence.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">=
Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-nofree-samefd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-samefd.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_exec_basic@multigp=
u-many-execqueues-many-vm-null-rebind.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-=
userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr=
-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3095/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +12 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bin=
dexecqueue.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bind=
execqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-pref=
etch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_exec_fault_mode@many-execqu=
eues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_exec_fault_mode@once-inval=
id-userptr-fault.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-us=
erptr-fault.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-w=
aitsip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_exec_system_allocator@many-l=
arge-mmap-free-huge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@xe_exec_system_allocator=
@many-large-mmap-free-huge-nomemset.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge-nomem=
set:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_exec_system_allocator@threads=
-many-stride-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_exec_system_allocator@threa=
ds-many-stride-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +16 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_sys=
tem_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4929">Intel XE#4929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-malloc.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_exec_system_allo=
cator@threads-shared-vm-many-large-malloc.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +12=
8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_exec_system_allocator@twice-=
mmap-new-huge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_exec_system_allocator@twice=
-mmap-new-huge-nomemset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_fault_injection=
@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@xe_mmap@pci-membarrier-parallel=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-lnl-5/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#=
4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8357/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-434/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-=
dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8357/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-435/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8357/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8357/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8357/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_835=
7/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-433/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8357/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8357/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8357/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1309=
5/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13095/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg=
2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3095/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shar=
d-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2=
-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/=
igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13095/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shar=
d-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2=
-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@xe_noexec_ping_pong.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-lnl-4/igt@xe_noexec_ping_pong.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13095/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/=
shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#9=
79</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_pat@pat-index-xelpg.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-lnl-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@xe_pm@d3cold-mocs.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-b=
mg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-7/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13095/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_pm_residency@cpg-basic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095=
/shard-lnl-5/igt@xe_pm_residency@cpg-basic.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched=
-if-idle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post=
-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a>) +2 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-s=
uspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_query@multigpu-query-confi=
g.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13095/shard-dg2-436/igt@xe_query@multigpu-query-config.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-dg2-434/igt@xe_query@multigpu-query-mem-us=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-lnl-6/igt@xe_query@multigpu-query-oa-units=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@xe_query@multigpu-query-pxp-sta=
tus.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13095/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_render_copy@render-stress-=
4-copies.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-dg2-433/igt@xe_render_copy@render-stress-4-copies.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-lnl-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-4194304:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@xe_vm@large-split-binds-4194304=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-5/igt@xe_vm@large-split-binds-4194304.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Int=
el XE#3428</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_async_flip=
s@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/ig=
t@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html=
">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@kms_ccs@random=
-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_cursor_legacy@=
2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +4 o=
ther tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13095/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095=
/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4772">In=
tel XE#4772</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13095/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sha=
rd-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a>) +2 other t=
ests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13095/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095=
/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
86">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13095/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">P=
ASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdm=
i-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_flip@plain-flip-ts-check=
-interruptible@a-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_flip@plain-flip-ts-check=
-interruptible@a-hdmi-a3.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard=
-lnl-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
095/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-4/igt@kms_vrr=
@cmrr@pipe-a-edp-1.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13095/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexe=
cqueue.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.ht=
ml">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html">INCOMPLETE</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@xe_pm@s4-=
vm-bind-prefetch.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13095/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-lnl-5/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13095/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt=
@kms_content_protection@legacy.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) =
+1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#23=
41</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3095/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_c=
ontent_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail =
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13095/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt=
@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13095/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-lega=
cy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_cursor_leg=
acy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-=
8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_flip@2x=
-plain-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdm=
i-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13095/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank@d-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracking@=
drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313=
">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13095/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13095/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3012">Intel XE#3012</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13095/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-bmg-1/i=
gt@kms_plane_multiple@2x-tiling-x.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"=
>Intel XE#2571</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel =
XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13095/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
95/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel =
XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13095/shard-bmg-5/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13095/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_exec_basic@multigpu=
-no-exec-userptr-invalidate-race.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-432/igt@xe_exec_basic@mult=
igpu-no-exec-userptr-invalidate-race.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other=
 tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8357/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13095/sh=
ard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13095/shard-dg2-435/igt@xe_peer2peer@read=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8357 -&gt; IGTPW_13095</li>
</ul>
<p>IGTPW_13095: 13095<br />
  IGT_8357: 8357<br />
  xe-3050-ca0305cadc2d34c8887b891b96226af17571b2a3: ca0305cadc2d34c8887b891=
b96226af17571b2a3</p>

</body>
</html>

--===============9161632167216936242==--
