Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B025ECD5BD0
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 02:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5976D10EB7A;
	Thu, 28 May 2026 02:36:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419FB10EB7A;
 Thu, 28 May 2026 02:36:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8500233020426835854=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fclose=5F?=
 =?utf-8?q?race=3A_set_VM=5FPAGE=5FEXECUTABLE_unconditionally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 May 2026 02:36:05 -0000
Message-ID: <177993576526.18055.11199430003704995013@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528014129.114452-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260528014129.114452-1-vitaly.prosyak@amd.com>
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

--===============8500233020426835854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_close_race: set VM_PAGE_EXECUTABLE unconditionally
URL   : https://patchwork.freedesktop.org/series/167424/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15267_BAT
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

  * IGT: IGT_8939 -> IGTPW_15267
  * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6

  IGTPW_15267: 61824528c2070767b6c04a0b4b095040468e00af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15267/index.html

--===============8500233020426835854==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_close_race: set VM_PAGE_EXECUTABLE unconditionally</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167424/">https://patchwork.freedesktop.org/series/167424/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15267/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15267/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt; XEIGTPW_15267_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8939 -&gt; IGTPW_15267</li>
<li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -&gt; xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6</li>
</ul>
<p>IGTPW_15267: 61824528c2070767b6c04a0b4b095040468e00af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb<br />
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6</p>

</body>
</html>

--===============8500233020426835854==--
