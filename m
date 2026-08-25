Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB175C5B572
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A72C10E112;
	Tue, 25 Aug 2026 04:04:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382AD10E112;
 Tue, 25 Aug 2026 04:03:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5531733641648205787=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fres?=
 =?utf-8?q?et=3A_add_GT_reset_fault_injection_stress_coverage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 04:03:52 -0000
Message-ID: <178763063222.80981.5913927616834761170@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825032520.507695-1-nishit.sharma@intel.com>
In-Reply-To: <20260825032520.507695-1-nishit.sharma@intel.com>
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

--===============5531733641648205787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: add GT reset fault injection stress coverage (rev2)
URL   : https://patchwork.freedesktop.org/series/172441/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9071_BAT -> XEIGTPW_15727_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9071 -> IGTPW_15727
  * Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -> xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad

  IGTPW_15727: 15727
  IGT_9071: 9071
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15727/index.html

--===============5531733641648205787==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: add GT reset fault injection stress coverage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172441/">https://patchwork.freedesktop.org/series/172441/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15727/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15727/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9071_BAT -&gt; XEIGTPW_15727_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9071 -&gt; IGTPW_15727</li>
<li>Linux: xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762 -&gt; xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad</li>
</ul>
<p>IGTPW_15727: 15727<br />
  IGT_9071: 9071<br />
  xe-5640-b830d7b865d1dcc0c199feef72cbe7bf7b208762: b830d7b865d1dcc0c199feef72cbe7bf7b208762<br />
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad</p>

</body>
</html>

--===============5531733641648205787==--
