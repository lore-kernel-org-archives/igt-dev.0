Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DB1D2FEFA
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 00:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61510E5D6;
	Wed, 28 Jan 2026 00:12:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705A10E115;
 Wed, 28 Jan 2026 00:12:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4250544515571174573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_Add_a_drive?=
 =?utf-8?q?r-unload_memory_leak_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jan 2026 00:12:56 -0000
Message-ID: <176955917640.197950.5695503806336152671@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127222848.940163-1-alex.hung@amd.com>
In-Reply-To: <20260127222848.940163-1-alex.hung@amd.com>
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

--===============4250544515571174573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add a driver-unload memory leak test
URL   : https://patchwork.freedesktop.org/series/160722/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8721_BAT -> XEIGTPW_14431_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14431_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8721 -> IGTPW_14431
  * Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -> xe-4460-0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0

  IGTPW_14431: d4f9df72738b4b820c9a9e9dd09cb04fa8ca7b08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1
  xe-4460-0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0: 0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/index.html

--===============4250544515571174573==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add a driver-unload memory leak test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160722/">https://patchwork.freedesktop.org/series/160722/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8721_BAT -&gt; XEIGTPW_14431_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14431_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14431/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8721 -&gt; IGTPW_14431</li>
<li>Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -&gt; xe-4460-0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0</li>
</ul>
<p>IGTPW_14431: d4f9df72738b4b820c9a9e9dd09cb04fa8ca7b08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1<br />
  xe-4460-0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0: 0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0</p>

</body>
</html>

--===============4250544515571174573==--
