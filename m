Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1508D74EC2
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 13:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582D10EAF7;
	Fri, 23 Jan 2026 13:54:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368310EAF5;
 Fri, 23 Jan 2026 13:54:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4084285403890603585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/1=5D_tests/xe=5Feudebug=5Fonline=3A_Extract_workload_?=
 =?utf-8?q?start_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Piotr Rudnicki" <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jan 2026 13:54:38 -0000
Message-ID: <176917647879.187526.7931462353345541845@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123125342.311645-2-piotr.rudnicki@intel.com>
In-Reply-To: <20260123125342.311645-2-piotr.rudnicki@intel.com>
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

--===============4084285403890603585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/1] tests/xe_eudebug_online: Extract workload start helpers
URL   : https://patchwork.freedesktop.org/series/160557/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8716_BAT -> XEIGTPW_14413_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8716 -> IGTPW_14413

  IGTPW_14413: 14413
  IGT_8716: 8716
  xe-4442-ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/index.html

--===============4084285403890603585==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/1] tests/xe_eudebug_online: Extract workload start helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160557/">https://patchwork.freedesktop.org/series/160557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8716_BAT -&gt; XEIGTPW_14413_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8716 -&gt; IGTPW_14413</li>
</ul>
<p>IGTPW_14413: 14413<br />
  IGT_8716: 8716<br />
  xe-4442-ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145</p>

</body>
</html>

--===============4084285403890603585==--
