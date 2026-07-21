Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE86C44529
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 04:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1210E1DF;
	Tue, 21 Jul 2026 04:29:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E755110E1DF;
 Tue, 21 Jul 2026 04:28:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1397304333280319375=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/xe-perf/xe-perf-recor?=
 =?utf-8?q?der=3A_don=27t_write_OA_report_multiple_times?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jul 2026 04:28:35 -0000
Message-ID: <178460811593.209631.2293683962467517173@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721003252.2224870-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260721003252.2224870-1-ashutosh.dixit@intel.com>
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

--===============1397304333280319375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/xe-perf/xe-perf-recorder: don't write OA report multiple times
URL   : https://patchwork.freedesktop.org/series/170781/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9015_BAT -> XEIGTPW_15569_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in XEIGTPW_15569_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#8543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9015/bat-wcl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15569/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#8543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8543


Build changes
-------------

  * IGT: IGT_9015 -> IGTPW_15569

  IGTPW_15569: 15569
  IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15569/index.html

--===============1397304333280319375==
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
<tr><td><b>Series:</b></td><td>tools/xe-perf/xe-perf-recorder: don&#x27;t write OA report multiple times</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170781/">https://patchwork.freedesktop.org/series/170781/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15569/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15569/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9015_BAT -&gt; XEIGTPW_15569_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15569_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9015/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15569/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8543">Intel XE#8543</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9015 -&gt; IGTPW_15569</li>
</ul>
<p>IGTPW_15569: 15569<br />
  IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405</p>

</body>
</html>

--===============1397304333280319375==--
