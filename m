Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B1DD1715D
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 04:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5510E2DF;
	Tue, 22 Oct 2024 04:11:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B921410E2DF;
 Tue, 22 Oct 2024 04:11:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6290445016718435553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A_sw?=
 =?utf-8?q?itch_modeset_from_uj_to_bj_and_vice-versa_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 22 Oct 2024 04:11:12 -0000
Message-ID: <172957027275.1307944.12247926851569116748@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
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

--===============6290445016718435553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev5)
URL   : https://patchwork.freedesktop.org/series/138525/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8080_BAT -> XEIGTPW_11948_BAT
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

  Here are the changes found in XEIGTPW_11948_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#288]) +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#2229])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-dg2-oem2:       [INCOMPLETE][5] ([Intel XE#2874]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][7] ([Intel XE#977]) -> [SKIP][8] ([Intel XE#2839] / [Intel XE#977])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#977]) -> [SKIP][10] ([Intel XE#2839] / [Intel XE#977])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][11] ([Intel XE#977]) -> [SKIP][12] ([Intel XE#2839] / [Intel XE#977])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#977]) -> [SKIP][14] ([Intel XE#2839] / [Intel XE#977])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][15] ([Intel XE#2245]) -> [SKIP][16] ([Intel XE#2237] / [Intel XE#2245])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][17] ([Intel XE#2245]) -> [SKIP][18] ([Intel XE#2237] / [Intel XE#2245])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][19] ([Intel XE#977]) -> [SKIP][20] ([Intel XE#2237] / [Intel XE#977])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8080 -> IGTPW_11948
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56

  IGTPW_11948: c989af852b4fd44ed6e7641579293daf5ecbe954 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/index.html

--===============6290445016718435553==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138525/">https://patchwork.freedesktop.org/series/138525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8080_BAT -&gt; XEIGTPW_11948_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11948_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8080/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11948/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8080 -&gt; IGTPW_11948</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56</li>
</ul>
<p>IGTPW_11948: c989af852b4fd44ed6e7641579293daf5ecbe954 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56</p>

</body>
</html>

--===============6290445016718435553==--
