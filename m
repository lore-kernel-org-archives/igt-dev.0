Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58200606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 23:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DF10E284;
	Fri, 30 Oct 2026 23:27:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0809F10E284;
 Fri, 30 Oct 2026 23:27:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7304073666720022285=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Test_unbinding_PCI_device_w?=
 =?utf-8?q?hile_OA_stream_is_open?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 23:27:01 -0000
Message-ID: <179340282100.96445.6246915623597530308@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
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

--===============7304073666720022285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test unbinding PCI device while OA stream is open
URL   : https://patchwork.freedesktop.org/series/177301/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9173_BAT -> XEIGTPW_16080_BAT
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

  * IGT: IGT_9173 -> IGTPW_16080
  * Linux: xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9 -> xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6

  IGTPW_16080: 16080
  IGT_9173: 9173
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9
  xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6: 238c1e3e984e2b7f948cb24165314b8d719a23d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16080/index.html

--===============7304073666720022285==
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
<tr><td><b>Series:</b></td><td>Test unbinding PCI device while OA stream is open</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177301/">https://patchwork.freedesktop.org/series/177301/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16080/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9173_BAT -&gt; XEIGTPW_16080_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9173 -&gt; IGTPW_16080</li>
<li>Linux: xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9 -&gt; xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6</li>
</ul>
<p>IGTPW_16080: 16080<br />
  IGT_9173: 9173<br />
  xe-6035-eea36991e0c743ff65da0735c827bb8d57de78f9: eea36991e0c743ff65da0735c827bb8d57de78f9<br />
  xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6: 238c1e3e984e2b7f948cb24165314b8d719a23d6</p>

</body>
</html>

--===============7304073666720022285==--
