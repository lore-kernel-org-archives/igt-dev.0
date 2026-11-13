Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EC606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 06:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511F10EA3E;
	Fri, 13 Nov 2026 06:22:37 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D5F10E44D;
 Fri, 13 Nov 2026 06:21:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8906672948341670574=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Fix_state_and_sink_status_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ray Wu" <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Nov 2026 06:21:37 -0000
Message-ID: <179455089784.18459.13688709550002551330@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113052845.3333547-1-ray.wu@amd.com>
In-Reply-To: <20261113052845.3333547-1-ray.wu@amd.com>
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

--===============8906672948341670574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Fix state and sink status checks
URL   : https://patchwork.freedesktop.org/series/178454/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9190_BAT -> XEIGTPW_16144_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9190 -> IGTPW_16144

  IGTPW_16144: 16144
  IGT_9190: 9190
  xe-6134-05f78ff3e7ecc6c78d5080c89c55a492fbc913d6: 05f78ff3e7ecc6c78d5080c89c55a492fbc913d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16144/index.html

--===============8906672948341670574==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Fix state and sink status checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178454/">https://patchwork.freedesktop.org/series/178454/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16144/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16144/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9190_BAT -&gt; XEIGTPW_16144_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9190 -&gt; IGTPW_16144</li>
</ul>
<p>IGTPW_16144: 16144<br />
  IGT_9190: 9190<br />
  xe-6134-05f78ff3e7ecc6c78d5080c89c55a492fbc913d6: 05f78ff3e7ecc6c78d5080c89c55a492fbc913d6</p>

</body>
</html>

--===============8906672948341670574==--
