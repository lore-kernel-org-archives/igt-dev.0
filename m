Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B9606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 07:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0710E83C;
	Wed,  4 Nov 2026 07:33:21 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F2110E83C;
 Wed,  4 Nov 2026 07:32:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3773136397264187455=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fsetmode=3A_Conv?=
 =?utf-8?q?ert_to_igt=5Fdisplay_atomic_API_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Nov 2026 07:32:27 -0000
Message-ID: <179377754754.115099.12890084142689987923@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104063442.2208555-1-jeevan.b@intel.com>
In-Reply-To: <20261104063442.2208555-1-jeevan.b@intel.com>
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

--===============3773136397264187455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Convert to igt_display atomic API (rev3)
URL   : https://patchwork.freedesktop.org/series/164189/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9177_BAT -> XEIGTPW_16100_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-nvls-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9177 -> IGTPW_16100
  * Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -> xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560

  IGTPW_16100: 16100
  IGT_9177: 9177
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html

--===============3773136397264187455==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Convert to igt_display atomic API (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164189/">https://patchwork.freedesktop.org/series/164189/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9177_BAT -&gt; XEIGTPW_16100_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9177 -&gt; IGTPW_16100</li>
<li>Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -&gt; xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560</li>
</ul>
<p>IGTPW_16100: 16100<br />
  IGT_9177: 9177<br />
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd<br />
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560</p>

</body>
</html>

--===============3773136397264187455==--
