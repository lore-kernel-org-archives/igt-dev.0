Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BFF606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 16:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F282D10F753;
	Tue, 17 Nov 2026 16:38:09 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002BD10F753;
 Tue, 17 Nov 2026 16:37:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3598136244621381984=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests=3A_limiting_suspend_t?=
 =?utf-8?q?ests_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Nov 2026 16:37:14 -0000
Message-ID: <179493343499.38588.15631229781708403980@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
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

--===============3598136244621381984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: limiting suspend tests (rev9)
URL   : https://patchwork.freedesktop.org/series/171813/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9196_BAT -> XEIGTPW_16166_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9196 -> IGTPW_16166
  * Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -> xe-6161-828eba8c208f3ecaee75d881e6b9d90fa52c90dd

  IGTPW_16166: 16166
  IGT_9196: 9196
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda
  xe-6161-828eba8c208f3ecaee75d881e6b9d90fa52c90dd: 828eba8c208f3ecaee75d881e6b9d90fa52c90dd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16166/index.html

--===============3598136244621381984==
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
<tr><td><b>Series:</b></td><td>tests: limiting suspend tests (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171813/">https://patchwork.freedesktop.org/series/171813/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16166/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16166/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9196_BAT -&gt; XEIGTPW_16166_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9196 -&gt; IGTPW_16166</li>
<li>Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -&gt; xe-6161-828eba8c208f3ecaee75d881e6b9d90fa52c90dd</li>
</ul>
<p>IGTPW_16166: 16166<br />
  IGT_9196: 9196<br />
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda<br />
  xe-6161-828eba8c208f3ecaee75d881e6b9d90fa52c90dd: 828eba8c208f3ecaee75d881e6b9d90fa52c90dd</p>

</body>
</html>

--===============3598136244621381984==--
