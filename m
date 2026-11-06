Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF28606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C5F112FCE;
	Fri,  6 Nov 2026 18:50:27 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02D10E3DD;
 Fri,  6 Nov 2026 18:49:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8332222175099117306=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe/shaders=3A_remove_explic?=
 =?utf-8?q?it_regioning_and_channel_offsets_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Nov 2026 18:49:26 -0000
Message-ID: <179399096611.134215.7072135331633791192@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
In-Reply-To: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
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

--===============8332222175099117306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/shaders: remove explicit regioning and channel offsets (rev3)
URL   : https://patchwork.freedesktop.org/series/176973/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9181_BAT -> XEIGTPW_16119_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9181 -> IGTPW_16119
  * Linux: xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea -> xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4

  IGTPW_16119: 16119
  IGT_9181: 9181
  xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea: 7797f00bc4da28646c612b8130ccd5192548ceea
  xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16119/index.html

--===============8332222175099117306==
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
<tr><td><b>Series:</b></td><td>xe/shaders: remove explicit regioning and channel offsets (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176973/">https://patchwork.freedesktop.org/series/176973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16119/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16119/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9181_BAT -&gt; XEIGTPW_16119_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9181 -&gt; IGTPW_16119</li>
<li>Linux: xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea -&gt; xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4</li>
</ul>
<p>IGTPW_16119: 16119<br />
  IGT_9181: 9181<br />
  xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea: 7797f00bc4da28646c612b8130ccd5192548ceea<br />
  xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4</p>

</body>
</html>

--===============8332222175099117306==--
