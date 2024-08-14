Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C04EC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189F210E47F;
	Wed, 14 Aug 2024 13:24:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3410E47F;
 Wed, 14 Aug 2024 13:24:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6163952299757592550=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/gpgpu=5Ffill=3A_Write_kern?=
 =?utf-8?q?el_using_inline_iga64_api_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Grzegorzek" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 13:24:48 -0000
Message-ID: <172364188835.632722.9588330285166496840@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814085636.1091046-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20240814085636.1091046-1-dominik.grzegorzek@intel.com>
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

--===============6163952299757592550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu_fill: Write kernel using inline iga64 api (rev3)
URL   : https://patchwork.freedesktop.org/series/136983/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7969_BAT -> XEIGTPW_11571_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11571_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11571_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11571_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gpgpu_fill@basic:
    - bat-adlp-vf:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-adlp-vf/igt@xe_gpgpu_fill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-adlp-vf/igt@xe_gpgpu_fill@basic.html
    - bat-adlp-7:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-adlp-7/igt@xe_gpgpu_fill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-adlp-7/igt@xe_gpgpu_fill@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11571_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pde-page:
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#877])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-bmg-1/igt@xe_vm@shared-pde-page.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-bmg-1/igt@xe_vm@shared-pde-page.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1885]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#2134]) -> [PASS][10] +4 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@fbdev@nullptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#2423] / [i915#2575]) -> [PASS][12] +50 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#2351]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#2229]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#2136]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#1130]) -> [PASS][22] +155 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2423] / [i915#2575]) -> [SKIP][24] ([Intel XE#623])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#2351]) -> [SKIP][26] ([Intel XE#455])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#2423] / [i915#2575]) -> [SKIP][28] ([i915#5274])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#2351]) -> [SKIP][30] ([Intel XE#929]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#2423] / [i915#2575]) -> [SKIP][32] ([Intel XE#1091]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1130]) -> [SKIP][34] ([Intel XE#288]) +32 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#1130]) -> [SKIP][36] ([Intel XE#255])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#1130]) -> [SKIP][38] ([Intel XE#977])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#1130]) -> [SKIP][40] ([Intel XE#979]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7969 -> IGTPW_11571

  IGTPW_11571: d89fb8591e7b9709054a31276aac4c3cb56a8243 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/index.html

--===============6163952299757592550==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu_fill: Write kernel using inline iga64 api (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136983/">https://patchwork.freedesktop.org/series/136983/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7969_BAT -&gt; XEIGTPW_11571_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11571_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11571_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11571_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_gpgpu_fill@basic:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-adlp-vf/igt@xe_gpgpu_fill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-adlp-vf/igt@xe_gpgpu_fill@basic.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-adlp-7/igt@xe_gpgpu_fill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-adlp-7/igt@xe_gpgpu_fill@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11571_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pde-page:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-bmg-1/igt@xe_vm@shared-pde-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-bmg-1/igt@xe_vm@shared-pde-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +155 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7969/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11571/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7969 -&gt; IGTPW_11571</li>
</ul>
<p>IGTPW_11571: d89fb8591e7b9709054a31276aac4c3cb56a8243 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6</p>

</body>
</html>

--===============6163952299757592550==--
