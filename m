Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC2FCCF9E4
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 15:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B8610EA51;
	Wed, 25 Sep 2024 15:32:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B7410EA56;
 Wed, 25 Sep 2024 15:32:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1869078761908442184=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv3=2C1/2=5D_tests/kms=5Fasync=5Fflips=3A_subtests_to_validate_?=
 =?utf-8?q?async_flips_on_atomic_path_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Sep 2024 15:32:04 -0000
Message-ID: <172727832446.1101698.17312241364238061586@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

--===============1869078761908442184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev3)
URL   : https://patchwork.freedesktop.org/series/137825/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8031_BAT -> XEIGTPW_11782_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11782_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11782_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-pvc-2 bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11782_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@fbdev@eof:
    - bat-adlp-vf:        [SKIP][3] ([Intel XE#2134]) -> [SKIP][4] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@fbdev@eof.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2461]) -> [SKIP][6] +30 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#2460]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        [SKIP][11] ([Intel XE#2464]) -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vf:        [SKIP][13] ([Intel XE#977]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][15] ([Intel XE#977]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#977]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-1:          [SKIP][19] ([Intel XE#2236]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        [SKIP][21] ([Intel XE#2468]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-bmg-2}:        [SKIP][23] ([Intel XE#2434] / [Intel XE#2548]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_pat@pat-index-xelpg:
    - {bat-bmg-2}:        [SKIP][25] ([Intel XE#2236]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11782_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#2235] / [Intel XE#2548]) -> [SKIP][28] ([Intel XE#2235])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          [SKIP][29] ([Intel XE#1470]) -> [SKIP][30] ([Intel XE#2853])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-2:          [SKIP][31] ([Intel XE#1470] / [Intel XE#2235]) -> [SKIP][32] ([Intel XE#2235] / [Intel XE#2853])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#929]) -> [SKIP][34] ([Intel XE#2850]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          [SKIP][35] ([Intel XE#2234]) -> [SKIP][36] ([Intel XE#2850]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][37] ([Intel XE#1091]) -> [SKIP][38] ([Intel XE#2849]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-1:          [SKIP][39] ([Intel XE#1091]) -> [SKIP][40] ([Intel XE#2849]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-2:          [SKIP][41] ([Intel XE#1091]) -> [SKIP][42] ([Intel XE#2849]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#1091]) -> [SKIP][44] ([Intel XE#2849]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][45] ([Intel XE#1420]) -> [SKIP][46] ([Intel XE#2838])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][47] ([Intel XE#979]) -> [SKIP][48] ([Intel XE#2838])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][49] ([Intel XE#1420]) -> [SKIP][50] ([Intel XE#2838])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][51] ([Intel XE#979]) -> [SKIP][52] ([Intel XE#2838])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vf:        [SKIP][53] ([Intel XE#979]) -> [SKIP][54] ([Intel XE#2838])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-2:          [SKIP][55] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][56] ([Intel XE#979])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8031 -> IGTPW_11782
  * Linux: xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990 -> xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47

  IGTPW_11782: fe414fe2777ee782742be45e1f1cf818e8778ee2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/index.html

--===============1869078761908442184==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137825/">https://patchwork.freedesktop.org/series/137825/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8031_BAT -&gt; XEIGTPW_11782_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11782_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11782_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-pvc-2 bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11782_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@fbdev@eof.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460">Intel XE#2460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11782_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8031/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11782/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8031 -&gt; IGTPW_11782</li>
<li>Linux: xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990 -&gt; xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47</li>
</ul>
<p>IGTPW_11782: fe414fe2777ee782742be45e1f1cf818e8778ee2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47</p>

</body>
</html>

--===============1869078761908442184==--
