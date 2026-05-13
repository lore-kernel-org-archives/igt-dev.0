Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F5FCD343F
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 00:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA210E093;
	Wed, 13 May 2026 00:47:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8610E5AC;
 Wed, 13 May 2026 00:47:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3099589185727526295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe=3A_Retry_xe=5Fvm=5Fb?=
 =?utf-8?q?ind_on_transient_-EBUSY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 00:47:43 -0000
Message-ID: <177863326324.64896.380410220105522031@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512153919.3676059-1-nishit.sharma@intel.com>
In-Reply-To: <20260512153919.3676059-1-nishit.sharma@intel.com>
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

--===============3099589185727526295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: Retry xe_vm_bind on transient -EBUSY
URL   : https://patchwork.freedesktop.org/series/166434/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8907_BAT -> XEIGTPW_15166_BAT
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

  * IGT: IGT_8907 -> IGTPW_15166
  * Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -> xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf

  IGTPW_15166: f7f41fa9f695f91f59706d133c4bd59991da7571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86
  xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf: 45be122deb2eaa1280d6496153c7661438ab8cdf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15166/index.html

--===============3099589185727526295==
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
<tr><td><b>Series:</b></td><td>lib/xe: Retry xe_vm_bind on transient -EBUSY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166434/">https://patchwork.freedesktop.org/series/166434/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15166/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15166/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8907_BAT -&gt; XEIGTPW_15166_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8907 -&gt; IGTPW_15166</li>
<li>Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -&gt; xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf</li>
</ul>
<p>IGTPW_15166: f7f41fa9f695f91f59706d133c4bd59991da7571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86<br />
  xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf: 45be122deb2eaa1280d6496153c7661438ab8cdf</p>

</body>
</html>

--===============3099589185727526295==--
