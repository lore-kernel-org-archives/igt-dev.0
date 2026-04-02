Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26348CC6B03
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 05:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAC710E294;
	Thu,  2 Apr 2026 05:55:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219F610E294;
 Thu,  2 Apr 2026 05:55:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2139080384671532978=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_add_KFD_DMA?=
 =?utf-8?q?-BUF_fence-outlives-module_unload_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Apr 2026 05:55:38 -0000
Message-ID: <177510933813.426678.15716733506001849077@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402044637.74655-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260402044637.74655-1-vitaly.prosyak@amd.com>
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

--===============2139080384671532978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload test
URL   : https://patchwork.freedesktop.org/series/164270/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8841_BAT -> XEIGTPW_14916_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14916_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14916/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8841 -> IGTPW_14916
  * Linux: xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c -> xe-4837-35370a958ae250844fbacb7a26230032a4fa661c

  IGTPW_14916: 705ff22706ca9ac921d2169db1c9045b260ca48f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8841: 8841
  xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c: 3bc4b20741a977a593763678ab6d5b23c3e10d6c
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14916/index.html

--===============2139080384671532978==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164270/">https://patchwork.freedesktop.org/series/164270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14916/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14916/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8841_BAT -&gt; XEIGTPW_14916_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14916_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14916/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8841 -&gt; IGTPW_14916</li>
<li>Linux: xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c -&gt; xe-4837-35370a958ae250844fbacb7a26230032a4fa661c</li>
</ul>
<p>IGTPW_14916: 705ff22706ca9ac921d2169db1c9045b260ca48f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8841: 8841<br />
  xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c: 3bc4b20741a977a593763678ab6d5b23c3e10d6c<br />
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c</p>

</body>
</html>

--===============2139080384671532978==--
