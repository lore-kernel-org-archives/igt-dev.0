Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD819C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 02:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E5F113054;
	Wed, 17 Apr 2024 02:13:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893F2113053;
 Wed, 17 Apr 2024 02:13:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2107602111037395707=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu=3A_add_check_for_?=
 =?utf-8?q?deadlock_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 02:13:31 -0000
Message-ID: <171332001156.1463550.9355492887042828995@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417011701.321744-1-jesse.zhang@amd.com>
In-Reply-To: <20240417011701.321744-1-jesse.zhang@amd.com>
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

--===============2107602111037395707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add check for deadlock test (rev3)
URL   : https://patchwork.freedesktop.org/series/132427/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7809_BAT -> XEIGTPW_11028_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_11028_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7809 -> IGTPW_11028
  * Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -> xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a

  IGTPW_11028: 0a9e0425f7878505b0c1509fd435ebaee54edfbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11028/index.html

--===============2107602111037395707==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add check for deadlock test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132427/">https://patchwork.freedesktop.org/series/132427/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11028/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11028/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7809_BAT -&gt; XEIGTPW_11028_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11028_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7809 -&gt; IGTPW_11028</li>
<li>Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -&gt; xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a</li>
</ul>
<p>IGTPW_11028: 0a9e0425f7878505b0c1509fd435ebaee54edfbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266<br />
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a</p>

</body>
</html>

--===============2107602111037395707==--
