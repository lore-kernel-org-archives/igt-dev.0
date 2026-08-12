Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1426AC5CFDB
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 20:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA52010E35E;
	Wed, 12 Aug 2026 20:40:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B210E117;
 Wed, 12 Aug 2026 20:39:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2627742195106855485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools=3A_remove_unnecessary?=
 =?utf-8?q?_shared_library_dependencies_from_standalone_tools_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Aug 2026 20:39:53 -0000
Message-ID: <178656719302.45178.8384682283331518504@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
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

--===============2627742195106855485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: remove unnecessary shared library dependencies from standalone tools (rev5)
URL   : https://patchwork.freedesktop.org/series/170485/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9054_BAT -> XEIGTPW_15669_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9054 -> IGTPW_15669

  IGTPW_15669: 5968952b5760fea9e505dddcb9a6cf6ef6a59d77 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a: 43db79ba5c8eac68b393cca2faa0b13a6505de1a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15669/index.html

--===============2627742195106855485==
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
<tr><td><b>Series:</b></td><td>tools: remove unnecessary shared library dependencies from standalone tools (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170485/">https://patchwork.freedesktop.org/series/170485/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15669/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15669/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9054_BAT -&gt; XEIGTPW_15669_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9054 -&gt; IGTPW_15669</li>
</ul>
<p>IGTPW_15669: 5968952b5760fea9e505dddcb9a6cf6ef6a59d77 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a: 43db79ba5c8eac68b393cca2faa0b13a6505de1a</p>

</body>
</html>

--===============2627742195106855485==--
