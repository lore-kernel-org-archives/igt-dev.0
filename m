Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C7606A330
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 09:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B695910E22C;
	Thu, 19 Nov 2026 09:30:38 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280011121F3;
 Thu, 19 Nov 2026 09:29:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6607126894367672554=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Fix_state_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ray Wu" <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Nov 2026 09:29:39 -0000
Message-ID: <179508057915.50127.9513999123011900769@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116070248.4103604-1-ray.wu@amd.com>
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
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

--===============6607126894367672554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Fix state checks (rev2)
URL   : https://patchwork.freedesktop.org/series/178634/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9198_BAT -> XEIGTPW_16179_BAT
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

  * IGT: IGT_9198 -> IGTPW_16179
  * Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -> xe-6185-2bdca9b1f8638ef27955d61c149bc6fac856d291

  IGTPW_16179: 16179
  IGT_9198: 9198
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef
  xe-6185-2bdca9b1f8638ef27955d61c149bc6fac856d291: 2bdca9b1f8638ef27955d61c149bc6fac856d291

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16179/index.html

--===============6607126894367672554==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Fix state checks (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178634/">https://patchwork.freedesktop.org/series/178634/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16179/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16179/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9198_BAT -&gt; XEIGTPW_16179_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9198 -&gt; IGTPW_16179</li>
<li>Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -&gt; xe-6185-2bdca9b1f8638ef27955d61c149bc6fac856d291</li>
</ul>
<p>IGTPW_16179: 16179<br />
  IGT_9198: 9198<br />
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef<br />
  xe-6185-2bdca9b1f8638ef27955d61c149bc6fac856d291: 2bdca9b1f8638ef27955d61c149bc6fac856d291</p>

</body>
</html>

--===============6607126894367672554==--
