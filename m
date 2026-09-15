Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC44C88E7D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 16:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545E10E211;
	Tue, 15 Sep 2026 16:59:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C007A10EFBD;
 Tue, 15 Sep 2026 16:58:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0457115241344871710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fras=3A_Add?=
 =?utf-8?q?_test_for_GPU_health_indicator_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Sep 2026 16:58:27 -0000
Message-ID: <178949150777.166934.16901672387678259127@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915133234.2105121-2-soham.purkait@intel.com>
In-Reply-To: <20260915133234.2105121-2-soham.purkait@intel.com>
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

--===============0457115241344871710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_ras: Add test for GPU health indicator (rev5)
URL   : https://patchwork.freedesktop.org/series/170588/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9098_BAT -> XEIGTPW_15848_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15848_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#9115])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9098/bat-wcl-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15848/bat-wcl-1/igt@xe_waitfence@reltime.html

  
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9098 -> IGTPW_15848
  * Linux: xe-5752-2bd2887dd30703cc280a0ca64919784240f66e2d -> xe-5753-094c4642078b25417a4885f8631aa38c00e87206

  IGTPW_15848: 15848
  IGT_9098: 9098
  xe-5752-2bd2887dd30703cc280a0ca64919784240f66e2d: 2bd2887dd30703cc280a0ca64919784240f66e2d
  xe-5753-094c4642078b25417a4885f8631aa38c00e87206: 094c4642078b25417a4885f8631aa38c00e87206

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15848/index.html

--===============0457115241344871710==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_ras: Add test for GPU health indicator (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170588/">https://patchwork.freedesktop.org/series/170588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15848/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9098_BAT -&gt; XEIGTPW_15848_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15848_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9098/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15848/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9098 -&gt; IGTPW_15848</li>
<li>Linux: xe-5752-2bd2887dd30703cc280a0ca64919784240f66e2d -&gt; xe-5753-094c4642078b25417a4885f8631aa38c00e87206</li>
</ul>
<p>IGTPW_15848: 15848<br />
  IGT_9098: 9098<br />
  xe-5752-2bd2887dd30703cc280a0ca64919784240f66e2d: 2bd2887dd30703cc280a0ca64919784240f66e2d<br />
  xe-5753-094c4642078b25417a4885f8631aa38c00e87206: 094c4642078b25417a4885f8631aa38c00e87206</p>

</body>
</html>

--===============0457115241344871710==--
