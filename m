Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D464CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBD010E9A3;
	Thu,  4 Sep 2025 08:23:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9471A10E99A;
 Thu,  4 Sep 2025 08:23:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0328722491085737655=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_fix_double_fr?=
 =?utf-8?q?ee_in_deadlock_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Sep 2025 08:23:46 -0000
Message-ID: <175697422660.302849.3521315576938915072@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904074034.3210105-1-Jesse.Zhang@amd.com>
In-Reply-To: <20250904074034.3210105-1-Jesse.Zhang@amd.com>
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

--===============0328722491085737655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: fix double free in deadlock helper
URL   : https://patchwork.freedesktop.org/series/154008/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8522_BAT -> XEIGTPW_13692_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13692_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8522 -> IGTPW_13692

  IGTPW_13692: 1d09e124a23acd72b3c326016b6d933d77ce4d7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8522: 8522
  xe-3675-0644d5ef504634c91573f5afde6196984c8f49a8: 0644d5ef504634c91573f5afde6196984c8f49a8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13692/index.html

--===============0328722491085737655==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: fix double free in deadlock helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154008/">https://patchwork.freedesktop.org/series/154008/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13692/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13692/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8522_BAT -&gt; XEIGTPW_13692_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13692_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8522 -&gt; IGTPW_13692</li>
</ul>
<p>IGTPW_13692: 1d09e124a23acd72b3c326016b6d933d77ce4d7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8522: 8522<br />
  xe-3675-0644d5ef504634c91573f5afde6196984c8f49a8: 0644d5ef504634c91573f5afde6196984c8f49a8</p>

</body>
</html>

--===============0328722491085737655==--
