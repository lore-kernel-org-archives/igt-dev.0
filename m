Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03093E95371
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894EA10E095;
	Wed,  4 Feb 2026 10:06:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188BC10E095;
 Wed,  4 Feb 2026 10:06:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7545412635693548836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fmul?=
 =?utf-8?q?ti=5Fqueue=3A_update_test_doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pawel Sikora" <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Feb 2026 10:06:08 -0000
Message-ID: <177019956810.223259.11088054444727130893@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204092653.112994-1-pawel.sikora@intel.com>
In-Reply-To: <20260204092653.112994-1-pawel.sikora@intel.com>
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

--===============7545412635693548836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: update test doc
URL   : https://patchwork.freedesktop.org/series/161137/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8732_BAT -> XEIGTPW_14487_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14487_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8732/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14487/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8732 -> IGTPW_14487
  * Linux: xe-4493-ff449f153b0966cfd7a7291670c927f6b6971d2a -> xe-4495-241994730989320c926da9f2d0a5ec80b48f993d

  IGTPW_14487: 14487
  IGT_8732: 020b7f0da24d0772e73338791288901d717d95f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4493-ff449f153b0966cfd7a7291670c927f6b6971d2a: ff449f153b0966cfd7a7291670c927f6b6971d2a
  xe-4495-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14487/index.html

--===============7545412635693548836==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: update test doc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161137/">https://patchwork.freedesktop.org/series/161137/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14487/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14487/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8732_BAT -&gt; XEIGTPW_14487_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14487_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8732/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14487/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8732 -&gt; IGTPW_14487</li>
<li>Linux: xe-4493-ff449f153b0966cfd7a7291670c927f6b6971d2a -&gt; xe-4495-241994730989320c926da9f2d0a5ec80b48f993d</li>
</ul>
<p>IGTPW_14487: 14487<br />
  IGT_8732: 020b7f0da24d0772e73338791288901d717d95f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4493-ff449f153b0966cfd7a7291670c927f6b6971d2a: ff449f153b0966cfd7a7291670c927f6b6971d2a<br />
  xe-4495-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d</p>

</body>
</html>

--===============7545412635693548836==--
