Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03367CD4F54
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 21:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CC910E3DC;
	Tue, 19 May 2026 21:03:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5010E3DC;
 Tue, 19 May 2026 21:03:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0221211691082286848=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdp=5Flink?=
 =?utf-8?q?train=5Ffallback=3A_Clear_stale_forced_LT_failure_counter_on_time?=
 =?utf-8?q?out?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 21:03:32 -0000
Message-ID: <177922461281.88514.5481626690837425857@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519082054.1971395-1-kunal1.joshi@intel.com>
In-Reply-To: <20260519082054.1971395-1-kunal1.joshi@intel.com>
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

--===============0221211691082286848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dp_linktrain_fallback: Clear stale forced LT failure counter on timeout
URL   : https://patchwork.freedesktop.org/series/166837/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8921_BAT -> XEIGTPW_15205_BAT
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

  * IGT: IGT_8921 -> IGTPW_15205
  * Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -> xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe

  IGTPW_15205: c5f504e1124796a2583192bd96a63879e9a3486a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8921: 8921
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15205/index.html

--===============0221211691082286848==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dp_linktrain_fallback: Clear stale forced LT failure counter on timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166837/">https://patchwork.freedesktop.org/series/166837/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15205/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15205/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8921_BAT -&gt; XEIGTPW_15205_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGTPW_15205</li>
<li>Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -&gt; xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe</li>
</ul>
<p>IGTPW_15205: c5f504e1124796a2583192bd96a63879e9a3486a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8921: 8921<br />
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497<br />
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe</p>

</body>
</html>

--===============0221211691082286848==--
