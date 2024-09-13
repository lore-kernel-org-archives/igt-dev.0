Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D3EEE271
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427A10EC87;
	Fri, 13 Sep 2024 00:28:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7E10EC85;
 Fri, 13 Sep 2024 00:28:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3491476855652790090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fqueue=5Freset=3A_a?=
 =?utf-8?q?dd_expected_error_codes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Sep 2024 00:28:30 -0000
Message-ID: <172618731057.994356.6136043411392311423@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912234908.450480-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240912234908.450480-1-vitaly.prosyak@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3491476855652790090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: add expected error codes
URL   : https://patchwork.freedesktop.org/series/138615/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8015_BAT -> XEIGTPW_11737_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8015 -> IGTPW_11737
  * Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -> xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510

  IGTPW_11737: 11737
  IGT_8015: 8015
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8
  xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510: e55e4cc47de4150012eec3e54b6d710967d66510

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11737/index.html

--===============3491476855652790090==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: add expected error codes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138615/">https://patchwork.freedesktop.org/series/138615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11737/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11737/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8015_BAT -&gt; XEIGTPW_11737_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8015 -&gt; IGTPW_11737</li>
<li>Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -&gt; xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510</li>
</ul>
<p>IGTPW_11737: 11737<br />
  IGT_8015: 8015<br />
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8<br />
  xe-1940-e55e4cc47de4150012eec3e54b6d710967d66510: e55e4cc47de4150012eec3e54b6d710967d66510</p>

</body>
</html>

--===============3491476855652790090==--
