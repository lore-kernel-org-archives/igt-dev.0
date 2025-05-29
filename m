Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC9FC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 09:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308F10E725;
	Thu, 29 May 2025 09:18:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681DF10E113;
 Thu, 29 May 2025 09:18:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2510381792821168053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_render-node=2C_gt_reset?=
 =?utf-8?q?_and_suspend_engine_activity_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 09:18:06 -0000
Message-ID: <174851028642.31242.2226546740042882303@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529065359.915117-1-riana.tauro@intel.com>
In-Reply-To: <20250529065359.915117-1-riana.tauro@intel.com>
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

--===============2510381792821168053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add render-node, gt reset and suspend engine activity tests (rev2)
URL   : https://patchwork.freedesktop.org/series/149526/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8383_BAT -> XEIGTPW_13205_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 8)
------------------------------

  Additional (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in XEIGTPW_13205_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-2:          NOTRUN -> [ABORT][1] ([Intel XE#5155])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13205/bat-bmg-2/igt@xe_module_load@load.html

  
  [Intel XE#5155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155


Build changes
-------------

  * IGT: IGT_8383 -> IGTPW_13205
  * Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -> xe-3157-bf0749a9930efe943554c3f73454d03c43779d15

  IGTPW_13205: 1045f92bde65e7039cdd128957691e8f4bffc623 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8383: 8383
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13205/index.html

--===============2510381792821168053==
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
<tr><td><b>Series:</b></td><td>Add render-node, gt reset and suspend engine activity tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149526/">https://patchwork.freedesktop.org/series/149526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13205/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13205/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8383_BAT -&gt; XEIGTPW_13205_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 8)</h2>
<p>Additional (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13205_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13205/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155">Intel XE#5155</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8383 -&gt; IGTPW_13205</li>
<li>Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -&gt; xe-3157-bf0749a9930efe943554c3f73454d03c43779d15</li>
</ul>
<p>IGTPW_13205: 1045f92bde65e7039cdd128957691e8f4bffc623 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8383: 8383<br />
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e<br />
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15</p>

</body>
</html>

--===============2510381792821168053==--
