Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E498ACCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931CF10E88D;
	Wed,  8 Oct 2025 21:46:16 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A710E88D;
 Wed,  8 Oct 2025 21:46:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2379503458065240482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/intel=5Fdevice=5Finfo?=
 =?utf-8?q?=3A_get_the_xe_=2Egraphics=5Frel_from_GMD=5FID_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Oct 2025 21:46:15 -0000
Message-ID: <175995997537.20465.15336074069885361373@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007050554.340485-1-x.wang@intel.com>
In-Reply-To: <20251007050554.340485-1-x.wang@intel.com>
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

--===============2379503458065240482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_device_info: get the xe .graphics_rel from GMD_ID (rev3)
URL   : https://patchwork.freedesktop.org/series/155527/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8579_BAT -> XEIGTPW_13877_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13877_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13877_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13877_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@close-fd-no-exec:
    - bat-lnl-2:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_exec_reset@close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_exec_reset@close-fd-no-exec.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        [SKIP][9] ([Intel XE#977]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         [SKIP][11] ([Intel XE#977]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][13] ([Intel XE#977]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#977]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][17] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][19] ([Intel XE#1420]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][21] ([Intel XE#1420]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][23] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][25] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vm:        [SKIP][27] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][31] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][33] ([Intel XE#2245]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][35] ([Intel XE#2245]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][37] ([Intel XE#977]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][39] ([Intel XE#977]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][41] ([Intel XE#979]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][43] ([Intel XE#2236]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][45] ([Intel XE#2236]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][47] ([Intel XE#979]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][49] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-vm:        [SKIP][51] ([Intel XE#979]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       [SKIP][53] ([Intel XE#979]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][55] ([Intel XE#979]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_reset@close-fd-no-exec:
    - {bat-ptl-2}:        [PASS][57] -> [FAIL][58] +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_exec_reset@close-fd-no-exec.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_exec_reset@close-fd-no-exec.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - {bat-ptl-1}:        [PASS][59] -> [FAIL][60] +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - {bat-ptl-vm}:       [PASS][61] -> [FAIL][62] +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_pat@pat-index-xelp:
    - {bat-ptl-2}:        [SKIP][63] ([Intel XE#5771]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - {bat-ptl-1}:        [SKIP][65] ([Intel XE#5771]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
    - {bat-ptl-vm}:       [SKIP][67] ([Intel XE#5771]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - {bat-ptl-1}:        [SKIP][69] ([Intel XE#5780]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - {bat-ptl-vm}:       [SKIP][71] ([Intel XE#5780]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - {bat-ptl-2}:        [SKIP][73] ([Intel XE#5780]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13877_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xehpc:
    - {bat-ptl-vm}:       [SKIP][75] ([Intel XE#5777]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - {bat-ptl-2}:        [SKIP][77] ([Intel XE#5777]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - {bat-ptl-1}:        [SKIP][79] ([Intel XE#5777]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8579 -> IGTPW_13877

  IGTPW_13877: 13877
  IGT_8579: 8579
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/index.html

--===============2379503458065240482==
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
<tr><td><b>Series:</b></td><td>lib/intel_device_info: get the xe .graphics_rel from GMD_ID (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155527/">https://patchwork.freedesktop.org/series/155527/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8579_BAT -&gt; XEIGTPW_13877_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13877_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13877_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13877_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_exec_reset@close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_exec_reset@close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_exec_reset@close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_exec_reset@close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13877_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8579/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13877/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8579 -&gt; IGTPW_13877</li>
</ul>
<p>IGTPW_13877: 13877<br />
  IGT_8579: 8579<br />
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f</p>

</body>
</html>

--===============2379503458065240482==--
