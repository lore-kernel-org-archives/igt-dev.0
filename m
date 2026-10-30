Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261F606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 07:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96DA10E849;
	Fri, 30 Oct 2026 07:04:05 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC81410E849;
 Fri, 30 Oct 2026 07:03:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5853286676676737999=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/msm/msm=5Fbo=3A_Add_m?=
 =?utf-8?q?emory_advice_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sri Vidya Patrayani" <spatraya@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 07:03:12 -0000
Message-ID: <179334379289.91824.13891857170674378110@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
In-Reply-To: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
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

--===============5853286676676737999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm/msm_bo: Add memory advice tests
URL   : https://patchwork.freedesktop.org/series/177215/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9171_BAT -> XEIGTPW_16076_BAT
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

  * IGT: IGT_9171 -> IGTPW_16076
  * Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -> xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b

  IGTPW_16076: 16076
  IGT_9171: 9171
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16076/index.html

--===============5853286676676737999==
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
<tr><td><b>Series:</b></td><td>tests/msm/msm_bo: Add memory advice tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177215/">https://patchwork.freedesktop.org/series/177215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16076/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16076/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9171_BAT -&gt; XEIGTPW_16076_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9171 -&gt; IGTPW_16076</li>
<li>Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -&gt; xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b</li>
</ul>
<p>IGTPW_16076: 16076<br />
  IGT_9171: 9171<br />
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355<br />
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b</p>

</body>
</html>

--===============5853286676676737999==--
