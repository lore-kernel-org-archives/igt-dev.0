Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A6E7718D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 19:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B210E26F;
	Mon, 23 Dec 2024 19:21:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA9310E443;
 Mon, 23 Dec 2024 19:21:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3668808184266006244=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Flive=5Fktest=3A_?=
 =?utf-8?q?Add_xe=5Fbo=5Fshrink_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Dec 2024 19:21:46 -0000
Message-ID: <173498170669.2204600.6438838442897062190@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241223180116.3857785-1-nirmoy.das@intel.com>
In-Reply-To: <20241223180116.3857785-1-nirmoy.das@intel.com>
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

--===============3668808184266006244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_live_ktest: Add xe_bo_shrink subtest
URL   : https://patchwork.freedesktop.org/series/142943/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8172_BAT -> XEIGTPW_12363_BAT
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

  Here are the changes found in XEIGTPW_12363_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] ([Intel XE#1192]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][3] -> [SKIP][4] ([Intel XE#1192]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][5] -> [SKIP][6] ([Intel XE#1192]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#1192]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1192]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][11] -> [SKIP][12] ([Intel XE#1192]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3899])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#3899])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-atsm-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-vf:        [PASS][17] -> [DMESG-WARN][18] ([Intel XE#3899])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-vf/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-vf/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3899])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-lnl-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-lnl-1/igt@xe_module_load@load.html
    - bat-pvc-2:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3899])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-pvc-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-pvc-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#3899])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#3899])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-1/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3899])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#3899])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-lnl-2/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-lnl-2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][31] ([Intel XE#1033]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [SKIP][33] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][34] ([Intel XE#1192])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8172 -> IGTPW_12363
  * Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -> xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea

  IGTPW_12363: b3a99875cb7221ed11936838b21f80b6ec9efd76 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077
  xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea: bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/index.html

--===============3668808184266006244==
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
<tr><td><b>Series:</b></td><td>tests/xe_live_ktest: Add xe_bo_shrink subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142943/">https://patchwork.freedesktop.org/series/142943/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8172_BAT -&gt; XEIGTPW_12363_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12363_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-vf/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-vf/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-pvc-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12363/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8172 -&gt; IGTPW_12363</li>
<li>Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -&gt; xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea</li>
</ul>
<p>IGTPW_12363: b3a99875cb7221ed11936838b21f80b6ec9efd76 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077<br />
  xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea: bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea</p>

</body>
</html>

--===============3668808184266006244==--
