Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0F606A339
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 03:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968CE10E287;
	Thu, 19 Nov 2026 03:24:34 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C685310E287;
 Thu, 19 Nov 2026 03:23:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5279583098816395804=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_Tile64_software_support?=
 =?utf-8?q?_in_bufops?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Nov 2026 03:23:36 -0000
Message-ID: <179505861680.48157.6551389110595247623@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
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

--===============5279583098816395804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Tile64 software support in bufops
URL   : https://patchwork.freedesktop.org/series/178897/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9198_BAT -> XEIGTPW_16172_BAT
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

  * IGT: IGT_9198 -> IGTPW_16172
  * Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -> xe-6183-7f983558aaf724daeafb5904dbb078835857b51e

  IGTPW_16172: 7dc9a3dcb6f2c725dc59dce42bd89f566cddf2c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9198: 9198
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef
  xe-6183-7f983558aaf724daeafb5904dbb078835857b51e: 7f983558aaf724daeafb5904dbb078835857b51e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16172/index.html

--===============5279583098816395804==
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
<tr><td><b>Series:</b></td><td>Add Tile64 software support in bufops</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178897/">https://patchwork.freedesktop.org/series/178897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16172/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9198_BAT -&gt; XEIGTPW_16172_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9198 -&gt; IGTPW_16172</li>
<li>Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -&gt; xe-6183-7f983558aaf724daeafb5904dbb078835857b51e</li>
</ul>
<p>IGTPW_16172: 7dc9a3dcb6f2c725dc59dce42bd89f566cddf2c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9198: 9198<br />
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef<br />
  xe-6183-7f983558aaf724daeafb5904dbb078835857b51e: 7f983558aaf724daeafb5904dbb078835857b51e</p>

</body>
</html>

--===============5279583098816395804==--
