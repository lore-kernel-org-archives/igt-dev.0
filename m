Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2056AC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 16:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE310E342;
	Tue, 11 Aug 2026 16:44:35 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEDA10E338;
 Tue, 11 Aug 2026 16:43:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7912245264668342737=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_test/kms=5Fcolorop=5Fhelper?=
 =?utf-8?q?=3A_don=27t_request_colorop_updates_indefinitely_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Aug 2026 16:43:56 -0000
Message-ID: <178646663624.40134.9068825239252641071@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260811143558.141813-1-mwen@igalia.com>
In-Reply-To: <20260811143558.141813-1-mwen@igalia.com>
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

--===============7912245264668342737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/kms_colorop_helper: don't request colorop updates indefinitely (rev2)
URL   : https://patchwork.freedesktop.org/series/167775/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9051_BAT -> XEIGTPW_15658_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-wcl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9051 -> IGTPW_15658
  * Linux: xe-5575-dc462ab791b686c48545c160ecc81be64f77a846 -> xe-5576-6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0

  IGTPW_15658: 86ce6fe7655d898c9e3f2c7434557c2b0fbc2471 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9051: 9051
  xe-5575-dc462ab791b686c48545c160ecc81be64f77a846: dc462ab791b686c48545c160ecc81be64f77a846
  xe-5576-6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0: 6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15658/index.html

--===============7912245264668342737==
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
<tr><td><b>Series:</b></td><td>test/kms_colorop_helper: don&#x27;t request colorop updates indefinitely (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167775/">https://patchwork.freedesktop.org/series/167775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15658/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15658/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9051_BAT -&gt; XEIGTPW_15658_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-wcl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9051 -&gt; IGTPW_15658</li>
<li>Linux: xe-5575-dc462ab791b686c48545c160ecc81be64f77a846 -&gt; xe-5576-6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0</li>
</ul>
<p>IGTPW_15658: 86ce6fe7655d898c9e3f2c7434557c2b0fbc2471 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9051: 9051<br />
  xe-5575-dc462ab791b686c48545c160ecc81be64f77a846: dc462ab791b686c48545c160ecc81be64f77a846<br />
  xe-5576-6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0: 6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0</p>

</body>
</html>

--===============7912245264668342737==--
