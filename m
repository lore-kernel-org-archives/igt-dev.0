Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB58606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 19:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A0D10E0FE;
	Mon,  2 Nov 2026 19:50:44 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B88D10E0CB;
 Mon,  2 Nov 2026 19:49:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8308541865856693071=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/kms=5Fwriteback=3A_C?=
 =?utf-8?q?heck_CRC_capture_survives_writeback_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Tipre" <tipreaditya@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Nov 2026 19:49:42 -0000
Message-ID: <179364898256.106471.9022799366202280388@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261025182420.52258-1-tipreaditya@gmail.com>
In-Reply-To: <20261025182420.52258-1-tipreaditya@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8308541865856693071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Check CRC capture survives writeback (rev3)
URL   : https://patchwork.freedesktop.org/series/176841/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9175_FULL -> XEIGTPW_16083_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9175 -> IGTPW_16083

  IGTPW_16083: 16083
  IGT_9175: 9175
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16083/index.html

--===============8308541865856693071==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Check CRC capture survives writeback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176841/">https://patchwork.freedesktop.org/series/176841/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16083/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16083/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9175_FULL -&gt; XEIGTPW_16083_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9175 -&gt; IGTPW_16083</li>
</ul>
<p>IGTPW_16083: 16083<br />
  IGT_9175: 9175<br />
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d</p>

</body>
</html>

--===============8308541865856693071==--
