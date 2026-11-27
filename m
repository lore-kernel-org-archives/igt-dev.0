Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBB606A31F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 22:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E123B10E4EE;
	Fri, 27 Nov 2026 22:01:34 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDC610E0D6;
 Fri, 27 Nov 2026 22:00:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6704373371687720113=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fvblank=3A_Query?=
 =?utf-8?q?_the_pipe_under_test_in_the_invalid_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Roy" <rongh7426@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 22:00:32 -0000
Message-ID: <179581683263.2807.3718725051938411786@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261126030034.641144-1-rongh7426@gmail.com>
In-Reply-To: <20261126030034.641144-1-rongh7426@gmail.com>
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

--===============6704373371687720113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Query the pipe under test in the invalid subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/179722/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9210_BAT -> XEIGTPW_16233_BAT
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

  * IGT: IGT_9210 -> IGTPW_16233

  IGTPW_16233: 16233
  IGT_9210: 9210
  xe-6251-994d8de7b77818fa55d1b7fc0a06dfd8eff8a595: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16233/index.html

--===============6704373371687720113==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Query the pipe under test in the invalid subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179722/">https://patchwork.freedesktop.org/series/179722/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16233/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16233/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9210_BAT -&gt; XEIGTPW_16233_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9210 -&gt; IGTPW_16233</li>
</ul>
<p>IGTPW_16233: 16233<br />
  IGT_9210: 9210<br />
  xe-6251-994d8de7b77818fa55d1b7fc0a06dfd8eff8a595: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595</p>

</body>
</html>

--===============6704373371687720113==--
