Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE2FB44B4
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 06:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2894110E0DD;
	Fri, 24 Apr 2026 06:34:29 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764E10E0DD;
 Fri, 24 Apr 2026 06:34:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7145753880767192724=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fexec=3A_A?=
 =?utf-8?q?dd_VM_rebind_stress_test_with_cpumask_cycling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Apr 2026 06:34:13 -0000
Message-ID: <177701245366.6496.15750220660354703447@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424042457.2178562-1-s.sebinraj@intel.com>
In-Reply-To: <20260424042457.2178562-1-s.sebinraj@intel.com>
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

--===============7145753880767192724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec: Add VM rebind stress test with cpumask cycling
URL   : https://patchwork.freedesktop.org/series/165395/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8872_FULL -> XEIGTPW_15049_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15049_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue} (NEW):
    - shard-lnl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-lnl-6/igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html

  
New tests
---------

  New tests have been introduced between XEIGT_8872_FULL and XEIGTPW_15049_FULL:

### New IGT tests (1) ###

  * igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 32.65] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15049_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#6841]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2291] / [Intel XE#7343])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#301]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#7705]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#1503])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#2142]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#7725]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#5937]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][20] ([Intel XE#7809]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][22] ([Intel XE#7705]) -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][24] ([Intel XE#7340]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [SKIP][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][52], [DMESG-WARN][53], [PASS][54], [PASS][55], [SKIP][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [DMESG-WARN][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [DMESG-WARN][76], [DMESG-WARN][77]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-1/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-10/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-1/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-10/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-6/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-8/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-10/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-8/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-2/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-7/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-5/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-10/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-10/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-9/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809


Build changes
-------------

  * IGT: IGT_8872 -> IGTPW_15049
  * Linux: xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c -> xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4

  IGTPW_15049: be64d028e3c87b4380f9135f8207ba17a055f531 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c: ecb61ba4a1f619b6944f4d0741b4d8a0910f460c
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/index.html

--===============7145753880767192724==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec: Add VM rebind stress te=
st with cpumask cycling</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165395/">https://patchwork.freedesktop.org/series/165395/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15049/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15049/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8872_FULL -&gt; XEIGTPW_15049_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
049_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue} (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15049/shard-lnl-6/igt@xe_exec_threads@threads-wq-stres=
s-rebind-bindexecqueue.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8872_FULL and XEIGTPW_15049=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 32.65] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15049_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-right-edge.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
49/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel =
XE#6841</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15049/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15049/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1504=
9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg=
-3/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-10/igt@=
kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15049/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video=
_enhance1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-9/igt@xe_pmu@engine-activity-multi-client@engine-drm_x=
e_engine_class_video_enhance1.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_pmu@engine-acti=
vity-multi-client@engine-drm_xe_engine_class_video_enhance1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725"=
>Intel XE#7725</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling@numvfs-random.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_sriov_auto_provi=
sioning@resources-released-on-vfs-disabling@numvfs-random.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel X=
E#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7809">Intel XE#7809</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Inte=
l XE#7705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15049/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8872/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard=
-lnl-8/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8872/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8872/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8872/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8872/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-10/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8872/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8872/shard-bmg-8/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
872/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-2/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8872/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8872/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8872/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8872/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8872/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405=
">Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15049/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15049/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15049/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15049/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/=
shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-10/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15049/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15049/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5049/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15049/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15049/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bm=
g-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15049/shard-bmg-6/igt@xe_module_load@load=
.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7405">Intel XE#7405</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8872 -&gt; IGTPW_15049</li>
<li>Linux: xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c -&gt; xe-4930-0=
21ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4</li>
</ul>
<p>IGTPW_15049: be64d028e3c87b4380f9135f8207ba17a055f531 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c: ecb61ba4a1f619b6944f4d0=
741b4d8a0910f460c<br />
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac=
0d6d52b8adaa1c4b4</p>

</body>
</html>

--===============7145753880767192724==--
