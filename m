Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B1CA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 01:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408D210EA65;
	Fri,  9 Oct 2026 01:22:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C09410EA65;
 Fri,  9 Oct 2026 01:21:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3147806923582340764=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_dmesg_ignore_regexes_wi?=
 =?utf-8?q?th_backslash_escapes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Oct 2026 01:21:49 -0000
Message-ID: <179150890956.792.2213512319519168418@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009002912.1391610-1-shuicheng.lin@intel.com>
In-Reply-To: <20261009002912.1391610-1-shuicheng.lin@intel.com>
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

--===============3147806923582340764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix dmesg ignore regexes with backslash escapes (rev2)
URL   : https://patchwork.freedesktop.org/series/175714/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9137_BAT -> XEIGTPW_15965_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9137 -> IGTPW_15965
  * Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -> xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650

  IGTPW_15965: 15965
  IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c
  xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650: 4f1de47ae94bb8aee6bc1c6105609646d9411650

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15965/index.html

--===============3147806923582340764==
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
<tr><td><b>Series:</b></td><td>Fix dmesg ignore regexes with backslash escapes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175714/">https://patchwork.freedesktop.org/series/175714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15965/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15965/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9137_BAT -&gt; XEIGTPW_15965_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9137 -&gt; IGTPW_15965</li>
<li>Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -&gt; xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650</li>
</ul>
<p>IGTPW_15965: 15965<br />
  IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c<br />
  xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650: 4f1de47ae94bb8aee6bc1c6105609646d9411650</p>

</body>
</html>

--===============3147806923582340764==--
