Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B6DC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573710E72E;
	Thu, 29 May 2025 14:28:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A1F10E72E;
 Thu, 29 May 2025 14:28:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7766992531896746262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Update_xe?=
 =?utf-8?q?_blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 14:28:26 -0000
Message-ID: <174852890655.32034.5718363424150539844@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529112811.1433740-1-swati2.sharma@intel.com>
In-Reply-To: <20250529112811.1433740-1-swati2.sharma@intel.com>
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

--===============7766992531896746262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Update xe blocklist
URL   : https://patchwork.freedesktop.org/series/149638/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8383_BAT -> XEIGTPW_13208_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  Additional (1): bat-bmg-2 
  Missing    (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in XEIGTPW_13208_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-2:          NOTRUN -> [ABORT][1] ([Intel XE#5155])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13208/bat-bmg-2/igt@xe_module_load@load.html

  
  [Intel XE#5155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155


Build changes
-------------

  * IGT: IGT_8383 -> IGTPW_13208
  * Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -> xe-3157-bf0749a9930efe943554c3f73454d03c43779d15

  IGTPW_13208: 58c4798f0ec5bf9fa342e9b463b95b4a496c4ae6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8383: 8383
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13208/index.html

--===============7766992531896746262==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Update xe blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149638/">https://patchwork.freedesktop.org/series/149638/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13208/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13208/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8383_BAT -&gt; XEIGTPW_13208_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>Additional (1): bat-bmg-2 <br />
  Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13208_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13208/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5155">Intel XE#5155</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8383 -&gt; IGTPW_13208</li>
<li>Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -&gt; xe-3157-bf0749a9930efe943554c3f73454d03c43779d15</li>
</ul>
<p>IGTPW_13208: 58c4798f0ec5bf9fa342e9b463b95b4a496c4ae6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8383: 8383<br />
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e<br />
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15</p>

</body>
</html>

--===============7766992531896746262==--
