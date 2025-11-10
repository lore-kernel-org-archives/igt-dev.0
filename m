Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1780CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 23:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6048510E039;
	Mon, 10 Nov 2025 23:55:36 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695F810E039;
 Mon, 10 Nov 2025 23:55:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5429937522314800262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_lib/intel=5Fblt=3A_BB_index_should_be_incremented_in_dwords?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Nov 2025 23:55:35 -0000
Message-ID: <176281893542.38379.8807006044630181179@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
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

--===============5429937522314800262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib/intel_blt: BB index should be incremented in dwords
URL   : https://patchwork.freedesktop.org/series/157322/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8618_BAT -> XEIGTPW_14033_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14033_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#2134]) -> [PASS][2] +4 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@fbdev@nullptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2351] / [Intel XE#6456]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#6456] / [Intel XE#6557]) -> [PASS][6] +6 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#6456]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#6456]) -> [PASS][12] +195 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#6456]) -> [SKIP][14] ([Intel XE#623])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#2351] / [Intel XE#6456]) -> [SKIP][16] ([Intel XE#455])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#6456]) -> [SKIP][18] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#6456]) -> [SKIP][20] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#6456]) -> [SKIP][22] ([Intel XE#288]) +30 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#6456] / [Intel XE#6557]) -> [SKIP][24] ([Intel XE#288]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#6456]) -> [SKIP][26] ([Intel XE#255])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#6456]) -> [SKIP][28] ([Intel XE#977])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#6456] / [Intel XE#6557]) -> [SKIP][30] ([Intel XE#2838] / [Intel XE#979])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#6456]) -> [SKIP][32] ([Intel XE#979])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#6456]) -> [SKIP][34] ([Intel XE#3342])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#6456]) -> [TIMEOUT][36] ([Intel XE#6506])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#6456]) -> [FAIL][38] ([Intel XE#6519])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#6456] / [Intel XE#6557]) -> [FAIL][40] ([Intel XE#6520])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8618 -> IGTPW_14033
  * Linux: xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd -> xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b

  IGTPW_14033: b0640c75e464f6a8ee752be62f1c01846c887542 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8618: 8618
  xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd: f2aadc35c771894c27f9b742d2593a2e00bb6ebd
  xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b: 4ce351022716985e9c1dd18583acd4d3d149cb5b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/index.html

--===============5429937522314800262==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib/intel_blt: BB index should be incremented in dwords</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157322/">https://patchwork.freedesktop.org/series/157322/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8618_BAT -&gt; XEIGTPW_14033_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14033_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +195 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@abstime.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@engine.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8618/bat-dg2-oem2/igt@xe_waitfence@reltime.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14033/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8618 -&gt; IGTPW_14033</li>
<li>Linux: xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd -&gt; xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b</li>
</ul>
<p>IGTPW_14033: b0640c75e464f6a8ee752be62f1c01846c887542 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8618: 8618<br />
  xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd: f2aadc35c771894c27f9b742d2593a2e00bb6ebd<br />
  xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b: 4ce351022716985e9c1dd18583acd4d3d149cb5b</p>

</body>
</html>

--===============5429937522314800262==--
