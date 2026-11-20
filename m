Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FD606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 02:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAA010E05E;
	Fri, 20 Nov 2026 02:59:24 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E5010E14E;
 Fri, 20 Nov 2026 02:58:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8729094994125617852=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Limit_driver_debug_logs_in_CI_runs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 02:58:24 -0000
Message-ID: <179514350485.56206.7191172640352638759@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119144249.200617-1-nishit.sharma@intel.com>
In-Reply-To: <20261119144249.200617-1-nishit.sharma@intel.com>
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

--===============8729094994125617852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Limit driver debug logs in CI runs (rev2)
URL   : https://patchwork.freedesktop.org/series/179060/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9200_BAT -> XEIGTPW_16185_BAT
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

  * IGT: IGT_9200 -> IGTPW_16185
  * Linux: xe-6193-5e1f7086abf6664123216020e4afb75a2512292e -> xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420

  IGTPW_16185: 16185
  IGT_9200: 9200
  xe-6193-5e1f7086abf6664123216020e4afb75a2512292e: 5e1f7086abf6664123216020e4afb75a2512292e
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16185/index.html

--===============8729094994125617852==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Limit driver debug logs in CI runs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179060/">https://patchwork.freedesktop.org/series/179060/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16185/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16185/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9200_BAT -&gt; XEIGTPW_16185_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9200 -&gt; IGTPW_16185</li>
<li>Linux: xe-6193-5e1f7086abf6664123216020e4afb75a2512292e -&gt; xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420</li>
</ul>
<p>IGTPW_16185: 16185<br />
  IGT_9200: 9200<br />
  xe-6193-5e1f7086abf6664123216020e4afb75a2512292e: 5e1f7086abf6664123216020e4afb75a2512292e<br />
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420</p>

</body>
</html>

--===============8729094994125617852==--
