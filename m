Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24049C3DA63
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 06:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390810E1C8;
	Fri, 26 Jul 2024 06:26:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B846910E1C8;
 Fri, 26 Jul 2024 06:26:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2393436405609578103=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe/xe=5Fquery=3A_Do_not_re?=
 =?utf-8?q?quire_QUERY=5FOA=5FUNITS_for_all_Xe_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Jul 2024 06:26:44 -0000
Message-ID: <172197520474.385076.1456465372064940360@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
In-Reply-To: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
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

--===============2393436405609578103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev3)
URL   : https://patchwork.freedesktop.org/series/136499/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7938_BAT -> XEIGTPW_11471_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11471_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#2196])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7938/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11471/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * IGT: IGT_7938 -> IGTPW_11471
  * Linux: xe-1669-6be9597893e018572d7d12dfb12cc19f68caa1e3 -> xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7

  IGTPW_11471: 11471
  IGT_7938: 0471a1097444389a901d78b260c24eaf4fc2d7df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1669-6be9597893e018572d7d12dfb12cc19f68caa1e3: 6be9597893e018572d7d12dfb12cc19f68caa1e3
  xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7: edd84625d093bb52bfb1c0c6feb12cff308d81b7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11471/index.html

--===============2393436405609578103==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136499/">https://patchwork.freedesktop.org/series/136499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11471/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11471/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7938_BAT -&gt; XEIGTPW_11471_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11471_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7938/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11471/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7938 -&gt; IGTPW_11471</li>
<li>Linux: xe-1669-6be9597893e018572d7d12dfb12cc19f68caa1e3 -&gt; xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7</li>
</ul>
<p>IGTPW_11471: 11471<br />
  IGT_7938: 0471a1097444389a901d78b260c24eaf4fc2d7df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1669-6be9597893e018572d7d12dfb12cc19f68caa1e3: 6be9597893e018572d7d12dfb12cc19f68caa1e3<br />
  xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7: edd84625d093bb52bfb1c0c6feb12cff308d81b7</p>

</body>
</html>

--===============2393436405609578103==--
