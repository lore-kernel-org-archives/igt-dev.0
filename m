Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F9CD6E53
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 18:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6919E11297A;
	Sat, 30 May 2026 18:38:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAB3112974;
 Sat, 30 May 2026 18:37:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1905823093051925504=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feudebug=3A?=
 =?utf-8?q?_Add_basic-vm-bind-ufence-no-ack_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 30 May 2026 18:37:54 -0000
Message-ID: <178016627403.27385.14488093802214622711@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260530180502.1773222-1-jan.maslak@intel.com>
In-Reply-To: <20260530180502.1773222-1-jan.maslak@intel.com>
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

--===============1905823093051925504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test
URL   : https://patchwork.freedesktop.org/series/167585/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8943_BAT -> XEIGTPW_15271_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8943 -> IGTPW_15271
  * Linux: xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579 -> xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119

  IGTPW_15271: 15271
  IGT_8943: 8943
  xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579: 158de01c718ed9dd7cb123d0df59a6077be26579
  xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119: f4ba932abb4422a63c72a272b0386f745ce9a119

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15271/index.html

--===============1905823093051925504==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167585/">https://patchwork.freedesktop.org/series/167585/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15271/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15271/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8943_BAT -&gt; XEIGTPW_15271_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8943 -&gt; IGTPW_15271</li>
<li>Linux: xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579 -&gt; xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119</li>
</ul>
<p>IGTPW_15271: 15271<br />
  IGT_8943: 8943<br />
  xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579: 158de01c718ed9dd7cb123d0df59a6077be26579<br />
  xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119: f4ba932abb4422a63c72a272b0386f745ce9a119</p>

</body>
</html>

--===============1905823093051925504==--
