Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD2C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 19:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF2F10E0E0;
	Sun,  6 Apr 2025 19:16:25 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99F10E059;
 Sun,  6 Apr 2025 19:16:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2033954351854868264=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Inject_errors_during_xe=5Fguc=5Fct=5Fsend=5Frecv=28?=
 =?utf-8?q?=29_xe=5Fguc=5Fmmio=5Fsend=5Frecv=28=29_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 19:16:23 -0000
Message-ID: <174396698393.41104.2035480435292904375@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
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

--===============2033954351854868264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv() xe_guc_mmio_send_recv() (rev4)
URL   : https://patchwork.freedesktop.org/series/144466/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12875_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12875_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12875_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12875_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> ([PASS][2], [ABORT][3])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-lnl:          [PASS][4] -> ([INCOMPLETE][5], [PASS][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([PASS][7], [INCOMPLETE][8]) +1 other test ( 1 incomplete, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-c-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_plane_lowres@tiling-4@pipe-c-dp-2.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-dg2-set2:     [PASS][10] -> ([PASS][11], [ABORT][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][13] -> ([INCOMPLETE][14], [PASS][15])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@xe_module_load@many-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@xe_module_load@many-reload.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][16] -> ([DMESG-WARN][17], [PASS][18])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_module_load@unload.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_module_load@unload.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_module_load@unload.html
    - shard-lnl:          [PASS][19] -> ([DMESG-WARN][20], [PASS][21])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@xe_module_load@unload.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@xe_module_load@unload.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@xe_module_load@unload.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [PASS][22] -> ([TIMEOUT][23], [PASS][24])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@xe_pm@d3hot-multiple-execs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@xe_pm@d3hot-multiple-execs.html

  
New tests
---------

  New tests have been introduced between XEIGT_8292_FULL and XEIGTPW_12875_FULL:

### New IGT tests (2) ###

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - Statuses : 2 fail(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12875_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][25] -> ([PASS][26], [FAIL][27]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#316]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2327]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#610])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#4543]) +2 other tests dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#1124]) +3 other tests ( 2 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][43] -> ([PASS][44], [SKIP][45]) ([Intel XE#2314] / [Intel XE#2894])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2314] / [Intel XE#2894])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2314] / [Intel XE#2894])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +242 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#455] / [Intel XE#787]) +14 other tests ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2887]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2887]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][58] -> [INCOMPLETE][59] ([Intel XE#3862]) +1 other test incomplete
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-lnl:          [PASS][60] -> ([ABORT][61], [PASS][62]) ([Intel XE#1727])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#787]) +54 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#3432])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2907])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][71], [PASS][72]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][73] -> ([INCOMPLETE][74], [PASS][75]) ([Intel XE#2705] / [Intel XE#4212])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][78] -> ([PASS][79], [INCOMPLETE][80]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][81] -> ([PASS][82], [DMESG-WARN][83]) ([Intel XE#1727] / [Intel XE#3113])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][84] -> ([PASS][85], [INCOMPLETE][86]) ([Intel XE#3124])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][87], [INCOMPLETE][88]) ([Intel XE#4212])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4417]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2325]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#306])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_chamelium_color@degamma.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#373]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2252]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#373]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][100], [SKIP][101]) ([Intel XE#2252])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][102], [FAIL][103]) ([Intel XE#1178] / [Intel XE#4132]) +1 other test ( 1 fail, 1 incomplete )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][104], [SKIP][105]) ([Intel XE#307])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2390])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#1178]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#1178])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([Intel XE#2320])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2320])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#2321])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#308])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2321])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2291]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][118], [PASS][119]) ([Intel XE#309])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#309]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][121] -> ([SKIP][122], [SKIP][123]) ([Intel XE#2291])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][124] -> ([PASS][125], [SKIP][126]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][127] -> ([SKIP][128], [INCOMPLETE][129]) ([Intel XE#309] / [Intel XE#3226])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> ([SKIP][130], [PASS][131]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#309])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][134] -> ([PASS][135], [SKIP][136]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-bmg:          [PASS][137] -> [SKIP][138] ([Intel XE#2291])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#323])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-lnl:          [PASS][140] -> ([PASS][141], [INCOMPLETE][142]) ([Intel XE#3226]) +1 other test ( 1 incomplete, 1 pass )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_cursor_legacy@single-bo.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_cursor_legacy@single-bo.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_cursor_legacy@torture-move@pipe-d:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][143], [PASS][144]) ([Intel XE#3226])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@torture-move@pipe-d.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-d.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1508])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [PASS][146] -> ([SKIP][147], [PASS][148]) ([Intel XE#4302])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][149] -> ([PASS][150], [SKIP][151]) ([Intel XE#3009])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dp_aux_dev.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_dp_aux_dev.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4354])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#4354])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][154] -> ([PASS][155], [SKIP][156]) ([Intel XE#4331])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#455]) +6 other tests ( 2 skip )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2244])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([Intel XE#776])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#776])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2373])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2374])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1135])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2316]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][167] -> ([PASS][168], [SKIP][169]) ([Intel XE#310]) +6 other tests ( 1 pass, 1 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1421]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [PASS][171] -> [SKIP][172] ([Intel XE#310]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][173] -> ([FAIL][174], [PASS][175]) ([Intel XE#301] / [Intel XE#3321])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][176] -> ([FAIL][177], [FAIL][178]) ([Intel XE#301])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][179] ([Intel XE#3321]) +6 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][180] -> ([FAIL][181], [PASS][182]) ([Intel XE#301])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#2316]) +2 other tests ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> ([PASS][185], [SKIP][186]) ([Intel XE#2316])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][187] -> ([SKIP][188], [FAIL][189]) ([Intel XE#2316] / [Intel XE#2882])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][190] -> [FAIL][191] ([Intel XE#2882])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-dp2-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][192] -> [SKIP][193] ([Intel XE#2316]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][194] -> ([SKIP][195], [PASS][196]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][197] -> ([PASS][198], [FAIL][199]) ([Intel XE#3098]) +1 other test ( 1 fail, 1 pass )
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][200] -> ([FAIL][201], [PASS][202]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][203] ([Intel XE#301] / [Intel XE#3321])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][204] -> [FAIL][205] ([Intel XE#301]) +1 other test fail
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][206] ([Intel XE#301]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][207] -> ([PASS][208], [FAIL][209]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][210] -> ([PASS][211], [FAIL][212]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][213] -> ([INCOMPLETE][214], [INCOMPLETE][215]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 2 incomplete )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][216] -> [INCOMPLETE][217] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][218] -> [DMESG-WARN][219] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][220] -> [INCOMPLETE][221] ([Intel XE#2049]) +1 other test incomplete
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [PASS][222] -> ([PASS][223], [FAIL][224]) ([Intel XE#2882]) +2 other tests ( 1 fail, 1 pass )
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#2293]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1401] / [Intel XE#1745])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#1401])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#2311]) +3 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#651] / [Intel XE#656]) +2 other tests ( 2 skip )
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#2311]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#656]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][239], [PASS][240]) ([Intel XE#656])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2312]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][244] -> ([SKIP][245], [PASS][246]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#4141]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#651]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#651]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2313]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#656]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#653] / [Intel XE#656])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#653]) +10 other tests ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#653]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#455]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#3374] / [Intel XE#3544])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][268] -> [SKIP][269] ([Intel XE#455])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [PASS][270] -> ([SKIP][271], [PASS][272]) ([Intel XE#1503])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][273] ([Intel XE#1450]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][275] -> ([SKIP][276], [PASS][277]) ([Intel XE#4328])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][278] -> ([PASS][279], [FAIL][280]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][281] ([Intel XE#616]) +5 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][282], [FAIL][283]) ([Intel XE#616])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][284] -> ([PASS][285], [SKIP][286]) ([Intel XE#4596])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][287] ([Intel XE#4212])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][288] ([Intel XE#2763]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#870])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#870])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#1122]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#2392])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][298] ([Intel XE#1430])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#908])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][301] -> ([PASS][302], [SKIP][303]) ([Intel XE#836])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][304] ([Intel XE#1439] / [Intel XE#3141])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#2893]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#1489]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][311] ([Intel XE#1489]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#2387])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#2234] / [Intel XE#2850])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][316] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#2850] / [Intel XE#929]) +5 other tests ( 2 skip )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr@pr-basic.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][319] ([Intel XE#1406]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#2939])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#3414] / [Intel XE#3904])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][324] -> ([PASS][325], [FAIL][326]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_setmode@basic.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][327] -> ([PASS][328], [SKIP][329]) ([Intel XE#455])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][330] -> ([FAIL][331], [FAIL][332]) ([Intel XE#771] / [Intel XE#899])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][333] -> ([FAIL][334], [PASS][335]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][336], [SKIP][337]) ([Intel XE#1499])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#756])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#756])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][340], [SKIP][341]) ([Intel XE#1091] / [Intel XE#2849])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#1091] / [Intel XE#2849])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][344] -> ([PASS][345], [FAIL][346]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][347] -> ([PASS][348], [FAIL][349]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#1126])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> [SKIP][351] ([Intel XE#2905])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#2905] / [Intel XE#3889])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-lnl:          NOTRUN -> ([SKIP][354], [SKIP][355]) ([Intel XE#2905])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][356], [SKIP][357]) ([Intel XE#2905]) +4 other tests ( 2 skip )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> ([SKIP][358], [SKIP][359]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2905]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][361], [SKIP][362]) ([Intel XE#4518])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][363] ([Intel XE#4518])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][364] ([Intel XE#688]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][365], [SKIP][366]) ([Intel XE#1392])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     NOTRUN -> ([PASS][367], [SKIP][368]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][371] ([Intel XE#1392]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][372] -> ([SKIP][373], [PASS][374]) ([Intel XE#1392]) +10 other tests ( 1 pass, 1 skip )
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][375] ([Intel XE#2322]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][376] -> [SKIP][377] ([Intel XE#1392]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][378] ([Intel XE#1392])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][379] ([Intel XE#288]) +7 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][380], [SKIP][381]) ([Intel XE#288]) +11 other tests ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][382] ([Intel XE#2905]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][383] ([Intel XE#3876])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][384] ([Intel XE#3903]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][385] ([Intel XE#3903])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][386], [SKIP][387]) ([Intel XE#378])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_module_load@force-load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][388] -> ([FAIL][389], [PASS][390]) ([Intel XE#4541])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@xe_oa@buffer-size.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@xe_oa@buffer-size.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][391] ([Intel XE#4541])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][392] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][393], [SKIP][394]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_oa@syncs-syncobj-none.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][395], [SKIP][396]) ([Intel XE#2541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][397] ([Intel XE#2427])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][398] ([Intel XE#2284] / [Intel XE#366])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][399] ([Intel XE#2284])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][400], [SKIP][401]) ([Intel XE#2284])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][402] -> [DMESG-WARN][403] ([Intel XE#4173]) +6 other tests dmesg-warn
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][404] ([Intel XE#584])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][405] -> [ABORT][406] ([Intel XE#1794])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][407] -> ([ABORT][408], [PASS][409]) ([Intel XE#1794])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][410] -> [ABORT][411] ([Intel XE#1794])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][412] ([Intel XE#944])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][413] ([Intel XE#944])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][414], [SKIP][415]) ([Intel XE#944])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> ([SKIP][416], [SKIP][417]) ([Intel XE#944]) +1 other test ( 2 skip )
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][418] ([Intel XE#944]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#4130])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-lnl:          NOTRUN -> [SKIP][421] ([Intel XE#4130])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][422] ([Intel XE#4273])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][423] ([Intel XE#4351])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          NOTRUN -> [SKIP][424] ([Intel XE#4351])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2191]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][427] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][428], [PASS][429])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][430] ([Intel XE#3862]) -> ([PASS][431], [PASS][432]) +1 other test ( 2 pass )
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][433] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][434], [PASS][435])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][436] ([Intel XE#2291]) -> ([PASS][437], [PASS][438]) +2 other tests ( 2 pass )
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#309]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#309]) -> ([PASS][442], [PASS][443])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][444] ([Intel XE#2291]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [INCOMPLETE][446] ([Intel XE#3226]) -> ([PASS][447], [PASS][448])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][449] ([Intel XE#3009]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#702]) -> ([PASS][452], [PASS][453])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_feature_discovery@display-2x.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][454] ([Intel XE#2316]) -> ([PASS][455], [PASS][456]) +4 other tests ( 2 pass )
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][457] ([Intel XE#301] / [Intel XE#3321]) -> ([PASS][458], [PASS][459])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][460] ([Intel XE#301]) -> [PASS][461] +1 other test pass
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#310]) -> [PASS][463]
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][464] ([Intel XE#2316]) -> [PASS][465] +1 other test pass
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#310]) -> ([PASS][467], [PASS][468]) +1 other test ( 2 pass )
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][469] ([Intel XE#2049]) -> ([PASS][470], [PASS][471]) +1 other test ( 2 pass )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][472] ([Intel XE#4543]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][474] ([Intel XE#1503]) -> ([PASS][475], [PASS][476])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_hdr@static-toggle.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][477] ([Intel XE#1503]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][479] ([Intel XE#3012]) -> ([PASS][480], [PASS][481])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#4596]) -> ([PASS][483], [PASS][484])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-4.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][485] ([Intel XE#718]) -> [PASS][486]
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][487] ([Intel XE#1435]) -> ([PASS][488], [PASS][489])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][490] ([Intel XE#1499]) -> [PASS][491]
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:
    - shard-dg2-set2:     [INCOMPLETE][492] -> ([PASS][493], [PASS][494]) +1 other test ( 2 pass )
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1392]) -> ([PASS][496], [PASS][497]) +1 other test ( 2 pass )
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-adlp:         [DMESG-WARN][498] ([Intel XE#4173]) -> [PASS][499]
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][500] ([Intel XE#4541]) -> ([PASS][501], [PASS][502])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@xe_oa@buffer-size.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][503] ([Intel XE#1794]) -> [PASS][504]
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#787]) -> ([SKIP][506], [SKIP][507]) ([Intel XE#455] / [Intel XE#787]) +12 other tests ( 2 skip )
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][509], [SKIP][510]) ([Intel XE#787])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#787]) -> [SKIP][512] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][513] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][514], [INCOMPLETE][515]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][516] ([Intel XE#4132]) -> ([SKIP][517], [FAIL][518]) ([Intel XE#1178] / [Intel XE#2341])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_content_protection@atomic.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][519] ([Intel XE#1178]) -> ([SKIP][520], [FAIL][521]) ([Intel XE#1178] / [Intel XE#2341])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][522] ([Intel XE#4132]) -> [FAIL][523] ([Intel XE#1178])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][524] ([Intel XE#2341]) -> [FAIL][525] ([Intel XE#1178])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][526] -> [FAIL][527] ([Intel XE#1178]) +1 other test fail
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][528] ([Intel XE#4132]) -> [FAIL][529] ([Intel XE#1178]) +1 other test fail
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][530] ([Intel XE#1188]) -> ([SKIP][531], [FAIL][532]) ([Intel XE#1188] / [Intel XE#455])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_content_protection@uevent.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_content_protection@uevent.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#309]) -> ([SKIP][534], [PASS][535]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-bmg:          [SKIP][536] ([Intel XE#2291]) -> ([PASS][537], [SKIP][538]) ([Intel XE#2291])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-bmg:          [INCOMPLETE][539] ([Intel XE#3226]) -> ([PASS][540], [INCOMPLETE][541]) ([Intel XE#3226])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][542] ([Intel XE#301]) -> ([PASS][543], [SKIP][544]) ([Intel XE#310])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][545] ([Intel XE#2316]) -> [FAIL][546] ([Intel XE#3321])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][547] ([Intel XE#301]) -> ([FAIL][548], [PASS][549]) ([Intel XE#301])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#310]) -> ([SKIP][551], [PASS][552]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][553] -> [TIMEOUT][554] ([Intel XE#1504]) +1 other test timeout
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][555] ([Intel XE#4543]) -> [DMESG-FAIL][556] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#651]) -> [SKIP][558] ([Intel XE#656]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#656]) -> ([SKIP][560], [SKIP][561]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][562] ([Intel XE#2312]) -> [SKIP][563] ([Intel XE#2311]) +5 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][564] ([Intel XE#2311]) -> ([SKIP][565], [SKIP][566]) ([Intel XE#2311] / [Intel XE#2312]) +16 other tests ( 2 skip )
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][567] ([Intel XE#2311]) -> ([SKIP][568], [SKIP][569]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#651]) -> ([SKIP][571], [SKIP][572]) ([Intel XE#651] / [Intel XE#656]) +15 other tests ( 2 skip )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#656]) -> ([SKIP][574], [PASS][575]) ([Intel XE#656]) +1 other test ( 1 pass, 1 skip )
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][576] ([Intel XE#2312]) -> ([SKIP][577], [SKIP][578]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][579] ([Intel XE#4141]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][582] ([Intel XE#2312]) -> [SKIP][583] ([Intel XE#4141]) +3 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][584] ([Intel XE#2312]) -> ([SKIP][585], [SKIP][586]) ([Intel XE#2312] / [Intel XE#4141])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#656]) -> ([SKIP][588], [SKIP][589]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#651]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#656])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][593] ([Intel XE#2312]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#2311]) +10 other tests ( 2 skip )
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][596] ([Intel XE#2311]) -> [SKIP][597] ([Intel XE#2312]) +2 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#656]) -> [SKIP][599] ([Intel XE#651])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][600] ([Intel XE#2313]) -> [SKIP][601] ([Intel XE#2312]) +3 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][602] ([Intel XE#2312]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#2313]) +10 other tests ( 2 skip )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#653]) -> ([SKIP][606], [SKIP][607]) ([Intel XE#656]) +1 other test ( 2 skip )
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#656]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#653] / [Intel XE#656]) +3 other tests ( 2 skip )
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][611] ([Intel XE#2313]) -> ([SKIP][612], [SKIP][613]) ([Intel XE#2312] / [Intel XE#2313]) +11 other tests ( 2 skip )
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#656]) -> ([SKIP][615], [SKIP][616]) ([Intel XE#653]) +3 other tests ( 2 skip )
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][617] ([Intel XE#2312]) -> ([SKIP][618], [SKIP][619]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#653]) -> ([SKIP][621], [SKIP][622]) ([Intel XE#653] / [Intel XE#656]) +16 other tests ( 2 skip )
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#653]) -> [SKIP][624] ([Intel XE#656]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][625] ([Intel XE#2312]) -> [SKIP][626] ([Intel XE#2313]) +5 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][627] ([Intel XE#2313]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][630] ([Intel XE#2493]) -> ([SKIP][631], [SKIP][632]) ([Intel XE#2493] / [Intel XE#4596])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][633] ([Intel XE#4596]) -> ([SKIP][634], [SKIP][635]) ([Intel XE#2493])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][636] ([Intel XE#2705] / [Intel XE#4540]) -> [ABORT][637] ([Intel XE#4540])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][638] ([Intel XE#4502] / [Intel XE#4540]) -> [ABORT][639] ([Intel XE#4540])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][640] ([Intel XE#718]) -> ([PASS][641], [FAIL][642]) ([Intel XE#718])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1500]) -> ([SKIP][644], [SKIP][645]) ([Intel XE#362])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][646] ([Intel XE#771]) -> ([FAIL][647], [FAIL][648]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][649] ([Intel XE#771]) -> ([FAIL][650], [PASS][651]) ([Intel XE#771])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-lnl:          [ABORT][652] ([Intel XE#4623]) -> ([ABORT][653], [PASS][654]) ([Intel XE#4623])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][655] ([Intel XE#1173]) -> ([SKIP][656], [FAIL][657]) ([Intel XE#1061] / [Intel XE#1173])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_peer2peer@read.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_peer2peer@read.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
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
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
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
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
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
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
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
  [Intel XE#3903]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3903
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
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


Build changes
-------------

  * IGT: IGT_8292 -> IGTPW_12875
  * Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -> xe-2875-b8a000ee8dbf41db533796cefbfb275cd306eb5b

  IGTPW_12875: 12875
  IGT_8292: 8292
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7
  xe-2875-b8a000ee8dbf41db533796cefbfb275cd306eb5b: b8a000ee8dbf41db533796cefbfb275cd306eb5b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/index.html

--===============2033954351854868264==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject error=
s during xe_guc_ct_send_recv() xe_guc_mmio_send_recv() (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144466/">https://patchwork.freedesktop.org/series/144466/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12875/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8292_FULL -&gt; XEIGTPW_12875_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12875_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12875_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
875_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe=
-a-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tile=
d-lnl-ccs@pipe-a-edp-1.html">ABORT</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe=
-b-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs@pipe-b-edp-1.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-=
c-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-bmg-7/igt@kms_plane_lowres@tiling-4@pipe-c-dp-2.html">IN=
COMPLETE</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_ct_send_recv.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_all=
oc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12875/shard-dg2-464/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops=
_alloc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_a=
lloc.html">ABORT</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@xe_module_load@many-reload.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg=
-2/igt@xe_module_load@many-reload.html">INCOMPLETE</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@xe_module_loa=
d@many-reload.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@xe_module_load@unload.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-46=
3/igt@xe_module_load@unload.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_module_load@un=
load.html">PASS</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@xe_module_load@unload.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3/ig=
t@xe_module_load@unload.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@xe_module_load@unload.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl=
-3/igt@xe_pm@d3hot-multiple-execs.html">TIMEOUT</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@xe_pm@d3hot-mult=
iple-execs.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8292_FULL and XEIGTPW_12875=
_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12875_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12875/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12875/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12875/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 o=
ther tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12875/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_big_fb@yf-tiled-ma=
x-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12875/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +242 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12=
-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12875/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/=
shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">PASS</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +54 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +43 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-=
ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4=
-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-=
b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/441=
6">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2875/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#=
2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@atomic=
.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@atomic.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4132">Intel XE#4132</a>) +1 other test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_content_protection@legacy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen=
-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-random-256=
x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_crc@cursor-random-51=
2x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12875/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12875/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-a=
tomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-at=
omic-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12875/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-=
size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-3/igt@kms_cursor_legacy@single-bo.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-ln=
l-7/igt@kms_cursor_legacy@single-bo.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@kms_cursor_legacy=
@single-bo.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test ( 1 incomplete=
, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@torture-move@=
pipe-d.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-d.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
875/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2=
-432/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt=
@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#=
3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
875/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2=
-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +6 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-b=
mg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Int=
el XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310=
</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2875/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Int=
el XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">I=
ntel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +6 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-=
hang.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-int=
erruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/=
shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875=
/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sha=
rd-bmg-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE=
#3098</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sha=
rd-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 =
other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-3=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2597">Intel XE#2597</a>) +1 other test ( 2 incomplete )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
875/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049=
">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2882">Intel XE#2882</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE=
#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p=
-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">I=
ntel XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-r=
gb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Int=
el XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/i=
gt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@=
kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@=
pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@=
pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/=
shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt=
@kms_joiner@basic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12875/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-s=
ize-64.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-siz=
e-64.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_plane_cursor@viewport.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-dg2-432/igt@kms_plane_cursor@viewport.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_plane_m=
ultiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
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
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_backlight@fade.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/s=
hard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-b=
mg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sha=
rd-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2=
-463/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_pm_rpm@dpms-n=
on-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12875/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr@pr-basic.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-=
dg2-433/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@k=
ms_setmode@basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/s=
hard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt=
@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
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
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-=
8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
5/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_writeback@writeback-fb-id-=
xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12875/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unb=
ind-each-numvfs-all.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbin=
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
875/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg=
-1/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-d=
rm_xe_engine_class_compute.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_compute_preempt@c=
ompute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/ig=
t@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_comput=
e.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4278">Intel XE#4278</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extende=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-si=
gint-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-vm-des=
troy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">I=
ntel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_eudebug_online@interrupt-o=
ther-debuggable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-d=
ebuggable.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-sram-target-vram.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-c=
aching-vram-bb-sram-target-vram.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_evict@evict-large-multi-vm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-ma=
ny-execqueues-many-vm-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test (=
 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel =
XE#2322</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bi=
nd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>) +10 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bi=
ndexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_exec_fault_mode@once-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_exec_fault_mode@once-userp=
tr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-=
invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint=
-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_exec_threads@threads-hang-u=
serptr-rebind-err.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3903">Intel XE#3903</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_module_load@force-load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
75/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@x=
e_oa@buffer-size.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_oa@buffer-size.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-1/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_oa@syncs-syncobj-none.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
5/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_oa@whitelisted-registers-u=
serspace-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspa=
ce-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-8=
/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_pm@s3-exec-after.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Int=
el XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-9/igt=
@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-=
2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/igt@xe_pm@s4-d3hot-basic=
-exec.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-2=
/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-7/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@xe_sriov_auto_=
provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-lnl-3/igt@xe_sriov_scheduling@nonpreempt-e=
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
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_bw@connected-linear-t=
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_bw@connect=
ed-linear-tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_bw@connect=
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
g/tree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">PASS</a>) +1 other test ( 2 pass )</li>
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
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sh=
ard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-h=
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
tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_cursor_le=
gacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_cursor_l=
egacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3226">Intel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-b=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-6/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bm=
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
GTPW_12875/shard-dg2-432/igt@kms_feature_discovery@display-2x.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-d=
g2-436/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-o=
ff-vs-modeset-interruptible.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shar=
d-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-d=
p4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12875/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_flip@blocking-absolu=
te-wf_vblank@b-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@blocking-absolute-w=
f_vblank@b-hdmi-a6.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-x-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-9/igt@kms_flip_tiling@=
flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/=
shard-bmg-3/igt@kms_hdr@static-toggle.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_hdr@static-=
toggle.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
875/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2=
-435/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-st=
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
5/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xma=
jor-compressed-compfmt0-vram01-vram01-451x451.html">INCOMPLETE</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-4=
32/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@xe_ccs@block-copy-compresse=
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
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>=
) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-=
xe_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shar=
d-bmg-6/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@xe_oa@buffer-size.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12875/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo=
-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@ccs-on-another=
-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-c=
cs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@km=
s_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-=
dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-=
6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +4 other tests skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">In=
tel XE#4132</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12875/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg=
-7/igt@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href=3D"h=
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
ree/intel-xe/IGTPW_12875/shard-bmg-7/igt@kms_content_protection@atomic@pipe=
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
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shar=
d-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4132">Intel XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_content_protection@srm@pipe-a=
-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12875/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-4=
35/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-435/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 =
other test ( 1 pass, 1 skip )</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_cursor_legacy@2x-no=
nblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@=
2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">I=
ntel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12875/shard-bmg-4/igt@kms_cursor_legacy@torture-move.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-b=
mg-6/igt@kms_cursor_legacy@torture-move.html">INCOMPLETE</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12875/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_flip@2x-single-buf=
fer-flip-vs-dpms-off-vs-modeset.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests =
( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12875/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TI=
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-adlp-1/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other =
test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tes=
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
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-432/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-433/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-464/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-1/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel X=
E#2493</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12875/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-2/i=
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
TPW_12875/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-bmg-3=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705=
">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_scaling@intel-ma=
x-src-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4540">Intel XE#4540</a>)</li>
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-436/igt@kms_plane_=
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
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard=
-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@kms_tiled_display@basic-=
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
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-l=
nl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12875/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@=
pipe-c-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12875/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-=
c-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/771">Intel XE#771</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-4/igt@xe_fault_inje=
ction@inject-fault-probe-function-wait_for_lmem_ready.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-lnl-8/ig=
t@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
623">Intel XE#4623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12875/sh=
ard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12875/shard-dg2-463/igt@xe_peer2peer@read=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8292 -&gt; IGTPW_12875</li>
<li>Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -&gt; xe-2875-b=
8a000ee8dbf41db533796cefbfb275cd306eb5b</li>
</ul>
<p>IGTPW_12875: 12875<br />
  IGT_8292: 8292<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54=
a9f4f34d476d2f3d7<br />
  xe-2875-b8a000ee8dbf41db533796cefbfb275cd306eb5b: b8a000ee8dbf41db533796c=
efbfb275cd306eb5b</p>

</body>
</html>

--===============2033954351854868264==--
