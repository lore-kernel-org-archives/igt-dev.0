Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AA606A335
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 18:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AF410E32C;
	Tue, 10 Nov 2026 18:06:16 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3641910E32C;
 Tue, 10 Nov 2026 18:05:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3855076392681367615=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel=3A_Add_edge_cas?=
 =?utf-8?q?e_and_race_condition_tests_for_GEM=5FCHANGE=5FHANDLE_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Francis" <david.francis@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 18:05:19 -0000
Message-ID: <179433391921.4761.16864145375013728222@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110153230.583745-1-David.Francis@amd.com>
In-Reply-To: <20261110153230.583745-1-David.Francis@amd.com>
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

--===============3855076392681367615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add edge case and race condition tests for GEM_CHANGE_HANDLE (rev5)
URL   : https://patchwork.freedesktop.org/series/175696/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9184_BAT -> XEIGTPW_16127_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9184 -> IGTPW_16127

  IGTPW_16127: 16127
  IGT_9184: 9184
  xe-6103-7b21e496056a6483b471dbc5f858059cb83becc6: 7b21e496056a6483b471dbc5f858059cb83becc6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16127/index.html

--===============3855076392681367615==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add edge case and race condition tests for GEM_CHANGE_HANDLE (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175696/">https://patchwork.freedesktop.org/series/175696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16127/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16127/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9184_BAT -&gt; XEIGTPW_16127_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9184 -&gt; IGTPW_16127</li>
</ul>
<p>IGTPW_16127: 16127<br />
  IGT_9184: 9184<br />
  xe-6103-7b21e496056a6483b471dbc5f858059cb83becc6: 7b21e496056a6483b471dbc5f858059cb83becc6</p>

</body>
</html>

--===============3855076392681367615==--
