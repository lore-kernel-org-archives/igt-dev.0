Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF2606A32D
	for <igt-dev@archiver.kernel.org>; Sat, 14 Nov 2026 02:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6510E15C;
	Sat, 14 Nov 2026 02:37:19 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34AB10E55E;
 Sat, 14 Nov 2026 02:36:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0754557473681053082=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcolorop=3A_redu?=
 =?utf-8?q?ce_test_run_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 14 Nov 2026 02:36:21 -0000
Message-ID: <179462378165.23291.5488013527626705568@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261114020614.830491-1-alex.hung@amd.com>
In-Reply-To: <20261114020614.830491-1-alex.hung@amd.com>
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

--===============0754557473681053082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_colorop: reduce test run time
URL   : https://patchwork.freedesktop.org/series/178541/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9192_BAT -> XEIGTPW_16145_BAT
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

  * IGT: IGT_9192 -> IGTPW_16145
  * Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -> xe-6141-d7f90df231a9bffeb291369663b3c09c59c4add6

  IGTPW_16145: 16145
  IGT_9192: 9192
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2
  xe-6141-d7f90df231a9bffeb291369663b3c09c59c4add6: d7f90df231a9bffeb291369663b3c09c59c4add6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16145/index.html

--===============0754557473681053082==
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
<tr><td><b>Series:</b></td><td>tests/kms_colorop: reduce test run time</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178541/">https://patchwork.freedesktop.org/series/178541/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16145/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16145/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9192_BAT -&gt; XEIGTPW_16145_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9192 -&gt; IGTPW_16145</li>
<li>Linux: xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2 -&gt; xe-6141-d7f90df231a9bffeb291369663b3c09c59c4add6</li>
</ul>
<p>IGTPW_16145: 16145<br />
  IGT_9192: 9192<br />
  xe-6137-2b4f99da078af1e9a391d4a4ff51550e30b711f2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2<br />
  xe-6141-d7f90df231a9bffeb291369663b3c09c59c4add6: d7f90df231a9bffeb291369663b3c09c59c4add6</p>

</body>
</html>

--===============0754557473681053082==--
