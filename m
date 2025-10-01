Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2B8CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 17:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B51010E73A;
	Wed,  1 Oct 2025 17:38:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19C10E6F6;
 Wed,  1 Oct 2025 17:38:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4944735694496824558=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Set_guc=5Fwait=5Fucode_pf_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 Oct 2025 17:38:53 -0000
Message-ID: <175934033330.384434.4937627803209925618@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251001151857.104568-1-zhanjun.dong@intel.com>
In-Reply-To: <20251001151857.104568-1-zhanjun.dong@intel.com>
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

--===============4944735694496824558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Set guc_wait_ucode pf only
URL   : https://patchwork.freedesktop.org/series/155298/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8568_BAT -> XEIGTPW_13850_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8568 -> IGTPW_13850
  * Linux: xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569 -> xe-3853-5f87abb254011980c8332008cfff72d2cfab4952

  IGTPW_13850: 13850
  IGT_8568: 8568
  xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569: bb42887c28cd6ede2c83547a9afc852a6aed3569
  xe-3853-5f87abb254011980c8332008cfff72d2cfab4952: 5f87abb254011980c8332008cfff72d2cfab4952

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13850/index.html

--===============4944735694496824558==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Set guc_wait_ucode pf only</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155298/">https://patchwork.freedesktop.org/series/155298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13850/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13850/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8568_BAT -&gt; XEIGTPW_13850_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8568 -&gt; IGTPW_13850</li>
<li>Linux: xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569 -&gt; xe-3853-5f87abb254011980c8332008cfff72d2cfab4952</li>
</ul>
<p>IGTPW_13850: 13850<br />
  IGT_8568: 8568<br />
  xe-3852-bb42887c28cd6ede2c83547a9afc852a6aed3569: bb42887c28cd6ede2c83547a9afc852a6aed3569<br />
  xe-3853-5f87abb254011980c8332008cfff72d2cfab4952: 5f87abb254011980c8332008cfff72d2cfab4952</p>

</body>
</html>

--===============4944735694496824558==--
