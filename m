Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC7606A320
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 10:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3905B10E050;
	Sat, 21 Nov 2026 10:18:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750210E3A5;
 Sat, 21 Nov 2026 10:16:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4993073084373980846=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcreate=3A_?=
 =?utf-8?q?Add_create-huge-sysmem-defer-backing_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 21 Nov 2026 10:16:26 -0000
Message-ID: <179525618628.63721.800128147523485527@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121093216.1509828-2-shuicheng.lin@intel.com>
In-Reply-To: <20261121093216.1509828-2-shuicheng.lin@intel.com>
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

--===============4993073084373980846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_create: Add create-huge-sysmem-defer-backing subtest
URL   : https://patchwork.freedesktop.org/series/179275/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9201_BAT -> XEIGTPW_16196_BAT
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

  * IGT: IGT_9201 -> IGTPW_16196
  * Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -> xe-6201-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0

  IGTPW_16196: 16196
  IGT_9201: 9201
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418
  xe-6201-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16196/index.html

--===============4993073084373980846==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_create: Add create-huge-sysmem-defer-backing subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179275/">https://patchwork.freedesktop.org/series/179275/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16196/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16196/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9201_BAT -&gt; XEIGTPW_16196_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9201 -&gt; IGTPW_16196</li>
<li>Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -&gt; xe-6201-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0</li>
</ul>
<p>IGTPW_16196: 16196<br />
  IGT_9201: 9201<br />
  xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418<br />
  xe-6201-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0</p>

</body>
</html>

--===============4993073084373980846==--
