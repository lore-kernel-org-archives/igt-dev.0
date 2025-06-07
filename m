Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E9C61CE7
	for <igt-dev@archiver.kernel.org>; Sat,  7 Jun 2025 09:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B5510E033;
	Sat,  7 Jun 2025 09:39:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42D610E00C;
 Sat,  7 Jun 2025 09:39:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7494374521349756147=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/intel/gem=5Feio=3A_F?=
 =?utf-8?q?ix_SIGABRT_in_kms_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 07 Jun 2025 09:39:55 -0000
Message-ID: <174928919566.57812.10961543524854881332@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
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

--===============7494374521349756147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_eio: Fix SIGABRT in kms subtest
URL   : https://patchwork.freedesktop.org/series/149898/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8397_FULL -> XEIGTPW_13248_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 0)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8397 -> IGTPW_13248
  * Linux: xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41 -> xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8

  IGTPW_13248: 5c317470d8e30d7088e7396f166984858100cece @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41: d5a5fd842902e24da80b61d64ce337ecee6b0c41
  xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8: b832e3126eed9068d80c521a6c6d3a9411354bf8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/index.html

--===============7494374521349756147==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_eio: Fix SIGABRT in kms subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149898/">https://patchwork.freedesktop.org/series/149898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8397_FULL -&gt; XEIGTPW_13248_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 0)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8397 -&gt; IGTPW_13248</li>
<li>Linux: xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41 -&gt; xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8</li>
</ul>
<p>IGTPW_13248: 5c317470d8e30d7088e7396f166984858100cece @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41: d5a5fd842902e24da80b61d64ce337ecee6b0c41<br />
  xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8: b832e3126eed9068d80c521a6c6d3a9411354bf8</p>

</body>
</html>

--===============7494374521349756147==--
