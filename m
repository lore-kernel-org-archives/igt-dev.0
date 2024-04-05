Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3385CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 13:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BBD113C21;
	Fri,  5 Apr 2024 13:34:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB53113C0E;
 Fri,  5 Apr 2024 13:34:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2031843870966151133=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fbig=5Fjoiner?=
 =?utf-8?q?=3A_cleanup_force_joiner_debugfs_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Apr 2024 13:34:45 -0000
Message-ID: <171232408525.1229792.4454077407117438199@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405111525.1748544-1-kunal1.joshi@intel.com>
In-Reply-To: <20240405111525.1748544-1-kunal1.joshi@intel.com>
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

--===============2031843870966151133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_joiner: cleanup force joiner debugfs state
URL   : https://patchwork.freedesktop.org/series/132071/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7800_BAT -> XEIGTPW_10983_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7800 -> IGTPW_10983
  * Linux: xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e -> xe-1045-019010dd870216d30458836f988b4461674a051a

  IGTPW_10983: 10983
  IGT_7800: 7800
  xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e: 9619b05620f06aaf89a5c603c2ba55c1419ee78e
  xe-1045-019010dd870216d30458836f988b4461674a051a: 019010dd870216d30458836f988b4461674a051a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10983/index.html

--===============2031843870966151133==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_joiner: cleanup force joiner debugfs state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132071/">https://patchwork.freedesktop.org/series/132071/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10983/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10983/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7800_BAT -&gt; XEIGTPW_10983_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7800 -&gt; IGTPW_10983</li>
<li>Linux: xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e -&gt; xe-1045-019010dd870216d30458836f988b4461674a051a</li>
</ul>
<p>IGTPW_10983: 10983<br />
  IGT_7800: 7800<br />
  xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e: 9619b05620f06aaf89a5c603c2ba55c1419ee78e<br />
  xe-1045-019010dd870216d30458836f988b4461674a051a: 019010dd870216d30458836f988b4461674a051a</p>

</body>
</html>

--===============2031843870966151133==--
