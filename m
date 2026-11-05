Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064F606A326
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B310E615;
	Thu,  5 Nov 2026 14:29:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DD310E615;
 Thu,  5 Nov 2026 14:28:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2189669006414899701=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fwedged=3A_?=
 =?utf-8?q?Add_cold-reset_wedge_test_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Nov 2026 14:28:36 -0000
Message-ID: <179388891640.125928.11069078347644984146@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105123002.1368655-4-sk.anirban@intel.com>
In-Reply-To: <20261105123002.1368655-4-sk.anirban@intel.com>
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

--===============2189669006414899701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_wedged: Add cold-reset wedge test (rev8)
URL   : https://patchwork.freedesktop.org/series/175755/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9177_BAT -> XEIGTPW_16110_BAT
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

  * IGT: IGT_9177 -> IGTPW_16110
  * Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -> xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4

  IGTPW_16110: 16110
  IGT_9177: 9177
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html

--===============2189669006414899701==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_wedged: Add cold-reset wedge test (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175755/">https://patchwork.freedesktop.org/series/175755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9177_BAT -&gt; XEIGTPW_16110_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9177 -&gt; IGTPW_16110</li>
<li>Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -&gt; xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4</li>
</ul>
<p>IGTPW_16110: 16110<br />
  IGT_9177: 9177<br />
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd<br />
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4</p>

</body>
</html>

--===============2189669006414899701==--
