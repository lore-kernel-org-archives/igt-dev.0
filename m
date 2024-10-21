Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DA3D17141
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 21:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314310E06B;
	Mon, 21 Oct 2024 21:51:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425810E06B;
 Mon, 21 Oct 2024 21:51:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4516668523465807626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Introduce_xe=5Fsriov=5Fflr_tes?=
 =?utf-8?q?t_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Oct 2024 21:51:22 -0000
Message-ID: <172954748214.1306981.3925645468681180267@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
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

--===============4516668523465807626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce xe_sriov_flr test (rev2)
URL   : https://patchwork.freedesktop.org/series/139773/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8080_BAT -> XEIGTPW_11946_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11946_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#288]) +32 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#288]) +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#2229])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#2229])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][6] ([Intel XE#2874]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-dg2-oem2:       [INCOMPLETE][8] ([Intel XE#2874]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][10] ([Intel XE#977]) -> [SKIP][11] ([Intel XE#2839] / [Intel XE#977])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][12] ([Intel XE#977]) -> [SKIP][13] ([Intel XE#2839] / [Intel XE#977])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][14] ([Intel XE#977]) -> [SKIP][15] ([Intel XE#2839] / [Intel XE#977])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][16] ([Intel XE#977]) -> [SKIP][17] ([Intel XE#2839] / [Intel XE#977])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][18] ([Intel XE#2245]) -> [SKIP][19] ([Intel XE#2237] / [Intel XE#2245])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][20] ([Intel XE#2245]) -> [SKIP][21] ([Intel XE#2237] / [Intel XE#2245])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][22] ([Intel XE#977]) -> [SKIP][23] ([Intel XE#2237] / [Intel XE#977])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8080 -> IGTPW_11946
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56

  IGTPW_11946: 8f8e155948212c21da27b63b4c375f531b7ac9b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/index.html

--===============4516668523465807626==
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
<tr><td><b>Series:</b></td><td>Introduce xe_sriov_flr test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139773/">https://patchwork.freedesktop.org/series/139773/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8080_BAT -&gt; XEIGTPW_11946_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11946_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11946/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8080 -&gt; IGTPW_11946</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56</li>
</ul>
<p>IGTPW_11946: 8f8e155948212c21da27b63b4c375f531b7ac9b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56</p>

</body>
</html>

--===============4516668523465807626==--
