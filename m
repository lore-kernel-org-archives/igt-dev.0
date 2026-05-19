Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063EFCD343F
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 01:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DB310E031;
	Tue, 19 May 2026 01:23:00 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEA910E031;
 Tue, 19 May 2026 01:22:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6094143841525778958=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/igt=5Fpower=3A_Fix_cr?=
 =?utf-8?q?ash_on_Xe_devices_by_initializing_xe=5Fdevice_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 01:22:42 -0000
Message-ID: <177915376218.83379.3174693985239518396@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
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

--===============6094143841525778958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/igt_power: Fix crash on Xe devices by initializing xe_device cache
URL   : https://patchwork.freedesktop.org/series/166775/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8918_BAT -> XEIGTPW_15198_BAT
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

  * IGT: IGT_8918 -> IGTPW_15198
  * Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -> xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356

  IGTPW_15198: 11321a7d760aa341bcbca466fe49fcb5bd7277fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8918: 8918
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15198/index.html

--===============6094143841525778958==
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
<tr><td><b>Series:</b></td><td>tools/igt_power: Fix crash on Xe devices by initializing xe_device cache</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166775/">https://patchwork.freedesktop.org/series/166775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15198/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15198/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8918_BAT -&gt; XEIGTPW_15198_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8918 -&gt; IGTPW_15198</li>
<li>Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -&gt; xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356</li>
</ul>
<p>IGTPW_15198: 11321a7d760aa341bcbca466fe49fcb5bd7277fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8918: 8918<br />
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900<br />
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356</p>

</body>
</html>

--===============6094143841525778958==--
