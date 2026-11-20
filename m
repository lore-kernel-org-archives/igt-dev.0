Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B0606A325
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 04:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0710ED28;
	Fri, 20 Nov 2026 04:19:04 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0793E10E833;
 Fri, 20 Nov 2026 04:18:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1584629659624022245=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/core=5Fsysfs=3A_Fix_l?=
 =?utf-8?q?ogic_for_EIO_and_other_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 04:18:07 -0000
Message-ID: <179514828702.56390.11101051684177989631@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119192357.117416-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261119192357.117416-1-kamil.konieczny@linux.intel.com>
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

--===============1584629659624022245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_sysfs: Fix logic for EIO and other fixes
URL   : https://patchwork.freedesktop.org/series/179132/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9200_BAT -> XEIGTPW_16187_BAT
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

  * IGT: IGT_9200 -> IGTPW_16187
  * Linux: xe-6193-5e1f7086abf6664123216020e4afb75a2512292e -> xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420

  IGTPW_16187: e5068549b70856f3ef72f4dbbee40e31c054786f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9200: 9200
  xe-6193-5e1f7086abf6664123216020e4afb75a2512292e: 5e1f7086abf6664123216020e4afb75a2512292e
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16187/index.html

--===============1584629659624022245==
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
<tr><td><b>Series:</b></td><td>tests/core_sysfs: Fix logic for EIO and other fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179132/">https://patchwork.freedesktop.org/series/179132/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16187/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9200_BAT -&gt; XEIGTPW_16187_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9200 -&gt; IGTPW_16187</li>
<li>Linux: xe-6193-5e1f7086abf6664123216020e4afb75a2512292e -&gt; xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420</li>
</ul>
<p>IGTPW_16187: e5068549b70856f3ef72f4dbbee40e31c054786f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9200: 9200<br />
  xe-6193-5e1f7086abf6664123216020e4afb75a2512292e: 5e1f7086abf6664123216020e4afb75a2512292e<br />
  xe-6194-9bf864cd53c8e7651a038b9be01b2b0dfc67b420: 9bf864cd53c8e7651a038b9be01b2b0dfc67b420</p>

</body>
</html>

--===============1584629659624022245==--
