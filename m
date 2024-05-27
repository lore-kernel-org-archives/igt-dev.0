Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58878C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE47510EAF0;
	Mon, 27 May 2024 07:04:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6012C10EAF0;
 Mon, 27 May 2024 07:04:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0382232171466203838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Update_kms=5Fplane_test_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 07:04:18 -0000
Message-ID: <171679345838.2212026.6974593374930663073@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524084807.480971-1-pranay.samala@intel.com>
In-Reply-To: <20240524084807.480971-1-pranay.samala@intel.com>
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

--===============0382232171466203838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update kms_plane test (rev2)
URL   : https://patchwork.freedesktop.org/series/134006/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7871_full -> XEIGTPW_11194_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11194_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11194_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11194_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-432/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-464/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-466/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-463/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-435/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-432/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-434/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-435/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-466/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-463/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-434/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-463/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-434/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-464/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-464/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-432/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-466/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-435/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_lease@lease-get:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][26]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-2/igt@kms_lease@lease-get.html

  * igt@kms_psr@psr2-suspend:
    - {shard-lnl}:        [PASS][27] -> [INCOMPLETE][28] +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-4/igt@kms_psr@psr2-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-5/igt@kms_psr@psr2-suspend.html

  
New tests
---------

  New tests have been introduced between XEIGT_7871_full and XEIGTPW_11194_full:

### New IGT tests (19) ###

  * igt@kms_plane@pixel-format@pipe-a-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [7.38] s

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.55] s

  * igt@kms_plane@pixel-format@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [7.45] s

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_plane@pixel-format@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane@plane-position-hole@pipe-a-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane@plane-position-hole@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane@plane-position-hole@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_plane@plane-position-hole@pipe-b-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_plane@plane-position-hole@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11194_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1 (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][29] ([Intel XE#305]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-lnl}:        [FAIL][30] ([Intel XE#1659]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs@pipe-c-edp-1:
    - {shard-lnl}:        [DMESG-WARN][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs@pipe-c-edp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs@pipe-c-edp-1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - {shard-lnl}:        [ABORT][34] ([Intel XE#1939]) -> [PASS][35] +2 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pm_dc@dc6-dpms:
    - {shard-lnl}:        [FAIL][36] ([Intel XE#1430]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr-sprite-blt:
    - {shard-lnl}:        [SKIP][38] ([Intel XE#1646] / [Intel XE#1650]) -> [PASS][39] +2 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@kms_psr@psr-sprite-blt.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-1/igt@kms_psr@psr-sprite-blt.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][40] ([Intel XE#1330]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - {shard-lnl}:        [DMESG-WARN][42] ([Intel XE#1638]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_pm_residency@idle-residency:
    - {shard-lnl}:        [FAIL][44] ([Intel XE#1442]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@xe_pm_residency@idle-residency.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-7/igt@xe_pm_residency@idle-residency.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1661]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1661
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1926]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1926
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7871 -> IGTPW_11194
  * Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -> xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c

  IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90
  xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c: ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/index.html

--===============0382232171466203838==
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
<tr><td><b>Series:</b></td><td>Update kms_plane test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/134006/">https://patchwork.freedesktop.org/series/134006/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11194/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11194/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7871_full -&gt; XEIGTPW_11194_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11194_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_11194_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11=
194_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11194/shard-dg2-432/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg=
2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11194/shard-dg2-466/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard=
-dg2-436/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-463/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/sh=
ard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194=
/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-434/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
194/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11194/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-463/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_11194/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11194/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-433/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11194/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11194/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-436/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_11194/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-432/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_11194/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-dg2-4=
35/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_lease@lease-get:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11194/shard-lnl-2/igt@kms_lease@lease-get.html">INCOMP=
LETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-4/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-5/igt@=
kms_psr@psr2-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7871_full and XEIGTPW_11194=
_full:</p>
<h3>New IGT tests (19)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11194_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1 (NEW):<=
ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11194/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip<=
/li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1659">Intel XE#1659</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs@pipe-c-e=
dp-1.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_11194/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-c=
cs@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-render.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-7/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shar=
d-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646">Intel XE#1646=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650"=
>Intel XE#1650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11194/shard-lnl-1/igt@kms_psr@psr-sprite-blt.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidat=
e:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecque=
ue-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/shard-lnl-3/igt@xe_exe=
c_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-1/igt@xe_exec_fault_mode@many-invalid-fault.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1638">Intel XE#1638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_11194/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442">Intel X=
E#1442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11194/shard-lnl-7/igt@xe_pm_residency@idle-residency.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7871 -&gt; IGTPW_11194</li>
<li>Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -&gt; xe-1343-e=
cacdcfd7d3355d063c223b9b2abb09d1ba0cb1c</li>
</ul>
<p>IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af1=
96458aa68e6074f90<br />
  xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c: ecacdcfd7d3355d063c223b=
9b2abb09d1ba0cb1c</p>

</body>
</html>

--===============0382232171466203838==--
