Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14383606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 22:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B410E280;
	Wed, 21 Oct 2026 22:26:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0099A112227;
 Wed, 21 Oct 2026 22:26:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2451152786777887324=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_test/kms=5Fcolorop=5Fhelper?=
 =?utf-8?q?=3A_don=27t_request_colorop_updates_indefinitely_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Oct 2026 22:26:02 -0000
Message-ID: <179262156299.54038.6132343072288436832@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021151929.62529-1-mwen@igalia.com>
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
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

--===============2451152786777887324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/kms_colorop_helper: don't request colorop updates indefinitely (rev4)
URL   : https://patchwork.freedesktop.org/series/167775/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9156_BAT -> XEIGTPW_16026_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 12)
------------------------------

  Missing    (3): bat-bmg-2 bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9156 -> IGTPW_16026
  * Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42 -> xe-5993-3e81ec7dad3d6d58702df76817fd87b4b7e4d347

  IGTPW_16026: 16026
  IGT_9156: 9156
  xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42: 24d867f5e671c78760ab39087a57c25ad98e1f42
  xe-5993-3e81ec7dad3d6d58702df76817fd87b4b7e4d347: 3e81ec7dad3d6d58702df76817fd87b4b7e4d347

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16026/index.html

--===============2451152786777887324==
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
<tr><td><b>Series:</b></td><td>test/kms_colorop_helper: don&#x27;t request colorop updates indefinitely (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167775/">https://patchwork.freedesktop.org/series/167775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16026/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16026/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9156_BAT -&gt; XEIGTPW_16026_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 12)</h2>
<p>Missing    (3): bat-bmg-2 bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9156 -&gt; IGTPW_16026</li>
<li>Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42 -&gt; xe-5993-3e81ec7dad3d6d58702df76817fd87b4b7e4d347</li>
</ul>
<p>IGTPW_16026: 16026<br />
  IGT_9156: 9156<br />
  xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42: 24d867f5e671c78760ab39087a57c25ad98e1f42<br />
  xe-5993-3e81ec7dad3d6d58702df76817fd87b4b7e4d347: 3e81ec7dad3d6d58702df76817fd87b4b7e4d347</p>

</body>
</html>

--===============2451152786777887324==--
