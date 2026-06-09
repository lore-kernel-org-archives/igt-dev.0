Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0535ACD8CAA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 11:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE46F10E101;
	Tue,  9 Jun 2026 11:25:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9010E101;
 Tue,  9 Jun 2026 11:24:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2856282593526983048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_test_for_oversubscribin?=
 =?utf-8?q?g_VRAM_in_multi_process_environment_that_creates_VM=2C_bind_large?=
 =?utf-8?q?_BOs_and_submit_workloads_nearly_simultaneously=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jun 2026 11:24:57 -0000
Message-ID: <178100429749.59616.606343935226947669@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609052220.358316-1-sobin.thomas@intel.com>
In-Reply-To: <20260609052220.358316-1-sobin.thomas@intel.com>
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

--===============2856282593526983048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add test for oversubscribing VRAM in multi process environment that creates VM, bind large BOs and submit workloads nearly simultaneously.
URL   : https://patchwork.freedesktop.org/series/168149/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8955_BAT -> XEIGTPW_15331_BAT
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

  Here are the changes found in XEIGTPW_15331_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8955/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15331/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * IGT: IGT_8955 -> IGTPW_15331
  * Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -> xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864

  IGTPW_15331: 15331
  IGT_8955: 8955
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9598bfe027c59ac21c
  xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864: 1e8798282ef0590ad21ca33d80e225208d9c7864

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15331/index.html

--===============2856282593526983048==
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
<tr><td><b>Series:</b></td><td>Add test for oversubscribing VRAM in multi process environment that creates VM, bind large BOs and submit workloads nearly simultaneously.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168149/">https://patchwork.freedesktop.org/series/168149/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15331/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15331/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8955_BAT -&gt; XEIGTPW_15331_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15331_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8955/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15331/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8955 -&gt; IGTPW_15331</li>
<li>Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -&gt; xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864</li>
</ul>
<p>IGTPW_15331: 15331<br />
  IGT_8955: 8955<br />
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9598bfe027c59ac21c<br />
  xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864: 1e8798282ef0590ad21ca33d80e225208d9c7864</p>

</body>
</html>

--===============2856282593526983048==--
