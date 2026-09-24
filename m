Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEAC9830E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 19:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D5910F758;
	Thu, 24 Sep 2026 19:14:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C7810F74E;
 Thu, 24 Sep 2026 19:13:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8795807987162011044=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel=3A_Don=27t_prob?=
 =?utf-8?q?e_intel=5Fallocator_offsets_without_full-ppgtt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Sep 2026 19:13:32 -0000
Message-ID: <179027721222.204817.505027935916702758@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
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

--===============8795807987162011044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Don't probe intel_allocator offsets without full-ppgtt
URL   : https://patchwork.freedesktop.org/series/174930/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9112_BAT -> XEIGTPW_15901_BAT
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

  * IGT: IGT_9112 -> IGTPW_15901
  * Linux: xe-5819-a61293e633b18c618fd2f7d508cf558db0f42227 -> xe-5822-cb0d221b3c4f294676df525cd2b561f3d4d35d99

  IGTPW_15901: bf447de932d4cb05e07346deeba18fa761fe016e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5819-a61293e633b18c618fd2f7d508cf558db0f42227: a61293e633b18c618fd2f7d508cf558db0f42227
  xe-5822-cb0d221b3c4f294676df525cd2b561f3d4d35d99: cb0d221b3c4f294676df525cd2b561f3d4d35d99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15901/index.html

--===============8795807987162011044==
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
<tr><td><b>Series:</b></td><td>tests/intel: Don&#x27;t probe intel_allocator offsets without full-ppgtt</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174930/">https://patchwork.freedesktop.org/series/174930/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15901/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15901/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9112_BAT -&gt; XEIGTPW_15901_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9112 -&gt; IGTPW_15901</li>
<li>Linux: xe-5819-a61293e633b18c618fd2f7d508cf558db0f42227 -&gt; xe-5822-cb0d221b3c4f294676df525cd2b561f3d4d35d99</li>
</ul>
<p>IGTPW_15901: bf447de932d4cb05e07346deeba18fa761fe016e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5819-a61293e633b18c618fd2f7d508cf558db0f42227: a61293e633b18c618fd2f7d508cf558db0f42227<br />
  xe-5822-cb0d221b3c4f294676df525cd2b561f3d4d35d99: cb0d221b3c4f294676df525cd2b561f3d4d35d99</p>

</body>
</html>

--===============8795807987162011044==--
