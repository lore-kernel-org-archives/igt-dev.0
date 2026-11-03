Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77E3606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 01:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F5510F2E0;
	Tue,  3 Nov 2026 01:43:12 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5843F10F2E0;
 Tue,  3 Nov 2026 01:42:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7687522402131366992=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/kms=5Fforce=5Fconnec?=
 =?utf-8?q?tor=5Fbasic=3A_Add_skip_reason_for_missing_VGA/HDMI_connector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Nov 2026 01:42:20 -0000
Message-ID: <179367014035.107919.16463021593038039784@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102130451.1162404-1-sowmiya.s@intel.com>
In-Reply-To: <20261102130451.1162404-1-sowmiya.s@intel.com>
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

--===============7687522402131366992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: Add skip reason for missing VGA/HDMI connector
URL   : https://patchwork.freedesktop.org/series/177454/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9175_FULL -> XEIGTPW_16086_FULL
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

  * IGT: IGT_9175 -> IGTPW_16086
  * Linux: xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d -> xe-6048-250a6b22eabe84f32114c55e0ad4c271bfe573b3

  IGTPW_16086: 16086
  IGT_9175: 9175
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d
  xe-6048-250a6b22eabe84f32114c55e0ad4c271bfe573b3: 250a6b22eabe84f32114c55e0ad4c271bfe573b3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16086/index.html

--===============7687522402131366992==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: Add skip reason for missing VGA/HDMI connector</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177454/">https://patchwork.freedesktop.org/series/177454/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16086/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16086/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9175_FULL -&gt; XEIGTPW_16086_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9175 -&gt; IGTPW_16086</li>
<li>Linux: xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d -&gt; xe-6048-250a6b22eabe84f32114c55e0ad4c271bfe573b3</li>
</ul>
<p>IGTPW_16086: 16086<br />
  IGT_9175: 9175<br />
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d<br />
  xe-6048-250a6b22eabe84f32114c55e0ad4c271bfe573b3: 250a6b22eabe84f32114c55e0ad4c271bfe573b3</p>

</body>
</html>

--===============7687522402131366992==--
