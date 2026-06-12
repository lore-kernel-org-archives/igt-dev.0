Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB04CD98D5
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 06:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D5D10E953;
	Fri, 12 Jun 2026 06:53:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8806610E953;
 Fri, 12 Jun 2026 06:52:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2952911391012081089=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fmadvise=3A?=
 =?utf-8?q?_Skip_purge_tests_under_low_RAM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Jun 2026 06:52:37 -0000
Message-ID: <178124715751.72090.5720030306386629938@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612045035.1942635-1-arvind.yadav@intel.com>
In-Reply-To: <20260612045035.1942635-1-arvind.yadav@intel.com>
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

--===============2952911391012081089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_madvise: Skip purge tests under low RAM (rev2)
URL   : https://patchwork.freedesktop.org/series/168229/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8960_BAT -> XEIGTPW_15354_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-lnl-2 bat-wcl-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8960 -> IGTPW_15354
  * Linux: xe-5244-311cbada9202146752938f54503d33980ee4f3f6 -> xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4

  IGTPW_15354: 9be3ae5e6c5fdbdda8310bacb1796c771e05575a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6
  xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4: 9ce63e3d9903982c053b125686abcb7a84357ed4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15354/index.html

--===============2952911391012081089==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_madvise: Skip purge tests under low RAM (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168229/">https://patchwork.freedesktop.org/series/168229/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15354/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15354/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8960_BAT -&gt; XEIGTPW_15354_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-lnl-2 bat-wcl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8960 -&gt; IGTPW_15354</li>
<li>Linux: xe-5244-311cbada9202146752938f54503d33980ee4f3f6 -&gt; xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4</li>
</ul>
<p>IGTPW_15354: 9be3ae5e6c5fdbdda8310bacb1796c771e05575a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6<br />
  xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4: 9ce63e3d9903982c053b125686abcb7a84357ed4</p>

</body>
</html>

--===============2952911391012081089==--
