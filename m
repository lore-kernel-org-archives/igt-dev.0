Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA47C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 21:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A17112059;
	Wed, 27 Mar 2024 21:18:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF2F112059;
 Wed, 27 Mar 2024 21:17:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4140462076406264053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Fix_WB_?=
 =?utf-8?q?caching_PAT_index_for_coherency_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Mar 2024 21:17:59 -0000
Message-ID: <171157427997.1060939.15077822360208388221@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <03d59e02328efb3b54deb0d24d3b68bb123ac8e8.1711563399.git.jagmeet.randhawa@intel.com>
In-Reply-To: <03d59e02328efb3b54deb0d24d3b68bb123ac8e8.1711563399.git.jagmeet.randhawa@intel.com>
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

--===============4140462076406264053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix WB caching PAT index for coherency mode (rev3)
URL   : https://patchwork.freedesktop.org/series/131605/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7786_BAT -> XEIGTPW_10933_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_10933_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1130]) -> [PASS][2] +9 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#1132]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1130]) -> [TIMEOUT][6] ([Intel XE#1027] / [Intel XE#1088])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1130]) -> [INCOMPLETE][8] ([Intel XE#804])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7786 -> IGTPW_10933
  * Linux: xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163 -> xe-1003-5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640

  IGTPW_10933: 52bffffde90c58c750b758596195460584740351 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1003-5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640: 5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/index.html

--===============4140462076406264053==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix WB caching PAT index for coherency mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131605/">https://patchwork.freedesktop.org/series/131605/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7786_BAT -&gt; XEIGTPW_10933_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10933_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10933/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7786 -&gt; IGTPW_10933</li>
<li>Linux: xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163 -&gt; xe-1003-5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640</li>
</ul>
<p>IGTPW_10933: 52bffffde90c58c750b758596195460584740351 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1003-5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640: 5e11d8eaccbd1c0a6b16bc6622dcbb78c350d640<br />
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163</p>

</body>
</html>

--===============4140462076406264053==--
