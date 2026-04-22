Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF0CF9B614
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 10:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424A10E0A3;
	Wed, 22 Apr 2026 10:48:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9910E0A3;
 Wed, 22 Apr 2026 10:48:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5813597933690948611=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel=3A_ctx=5Frestor?=
 =?utf-8?q?e_rollback_on_invalid_input_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Apr 2026 10:48:34 -0000
Message-ID: <177685491496.484982.2852461919988685215@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
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

--===============5813597933690948611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: ctx_restore rollback on invalid input (rev2)
URL   : https://patchwork.freedesktop.org/series/165130/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8867_BAT -> XEIGTPW_15035_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8867 -> IGTPW_15035

  IGTPW_15035: 580bfa7b398623b993d2aa1f98a0766798d72f87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8867: e927534a37db761655abb06191ce5c6390ad307a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4924-84de0c4efa971d100d339d4b4aef24676b86c58e: 84de0c4efa971d100d339d4b4aef24676b86c58e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15035/index.html

--===============5813597933690948611==
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
<tr><td><b>Series:</b></td><td>tests/intel: ctx_restore rollback on invalid input (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165130/">https://patchwork.freedesktop.org/series/165130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15035/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15035/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8867_BAT -&gt; XEIGTPW_15035_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8867 -&gt; IGTPW_15035</li>
</ul>
<p>IGTPW_15035: 580bfa7b398623b993d2aa1f98a0766798d72f87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8867: e927534a37db761655abb06191ce5c6390ad307a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4924-84de0c4efa971d100d339d4b4aef24676b86c58e: 84de0c4efa971d100d339d4b4aef24676b86c58e</p>

</body>
</html>

--===============5813597933690948611==--
