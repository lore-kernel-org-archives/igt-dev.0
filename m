Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABC606A895
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 03:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73C510E049;
	Mon, 16 Nov 2026 03:26:41 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A710E049;
 Mon, 16 Nov 2026 03:25:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3980503281485000732=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Fix_state_and_sink_status_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ray Wu" <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Nov 2026 03:25:40 -0000
Message-ID: <179479954099.27504.13885639805165589838@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116022447.3981877-1-ray.wu@amd.com>
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
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

--===============3980503281485000732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Fix state and sink status checks (rev2)
URL   : https://patchwork.freedesktop.org/series/178454/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9192_BAT -> XEIGTPW_16148_BAT
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

  * IGT: IGT_9192 -> IGTPW_16148
  * Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -> xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca

  IGTPW_16148: 16148
  IGT_9192: 9192
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2
  xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca: 1e689143b673f45c712bacde9b1c4b8c360efdca

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16148/index.html

--===============3980503281485000732==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Fix state and sink status checks (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178454/">https://patchwork.freedesktop.org/series/178454/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16148/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9192_BAT -&gt; XEIGTPW_16148_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9192 -&gt; IGTPW_16148</li>
<li>Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -&gt; xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca</li>
</ul>
<p>IGTPW_16148: 16148<br />
  IGT_9192: 9192<br />
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2<br />
  xe-6146-1e689143b673f45c712bacde9b1c4b8c360efdca: 1e689143b673f45c712bacde9b1c4b8c360efdca</p>

</body>
</html>

--===============3980503281485000732==--
