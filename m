Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE0CFD368
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 05:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4410E16E;
	Tue, 25 Nov 2025 05:48:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DA510E16E;
 Tue, 25 Nov 2025 05:48:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7568497404946637460=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_kms=3A_Small_cleanups_and_r?=
 =?utf-8?q?efactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Nov 2025 05:48:38 -0000
Message-ID: <176404971872.23759.11002789245073244697@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
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

--===============7568497404946637460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms: Small cleanups and refactoring
URL   : https://patchwork.freedesktop.org/series/157930/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8637_BAT -> XEIGTPW_14100_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8637 -> IGTPW_14100

  IGTPW_14100: a77dace22491ff7d0d9bc885a598acd0efb34d4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4141-c701e79730169fab373fba7e759497d755fac592: c701e79730169fab373fba7e759497d755fac592

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14100/index.html

--===============7568497404946637460==
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
<tr><td><b>Series:</b></td><td>kms: Small cleanups and refactoring</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157930/">https://patchwork.freedesktop.org/series/157930/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14100/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14100/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8637_BAT -&gt; XEIGTPW_14100_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8637 -&gt; IGTPW_14100</li>
</ul>
<p>IGTPW_14100: a77dace22491ff7d0d9bc885a598acd0efb34d4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4141-c701e79730169fab373fba7e759497d755fac592: c701e79730169fab373fba7e759497d755fac592</p>

</body>
</html>

--===============7568497404946637460==--
