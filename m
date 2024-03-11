Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E4DC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 22:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8960D112CCC;
	Mon, 11 Mar 2024 22:19:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A594112CCC;
 Mon, 11 Mar 2024 22:19:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3042299404721856293=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv4=2C1/4=5D_lib/igt=5Fsysfs=3A_Use_same_var_for_sizeof=28=29_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 11 Mar 2024 22:19:58 -0000
Message-ID: <171019559816.681939.15464678547829326122@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
In-Reply-To: <20240228223134.3908035-1-lucas.demarchi@intel.com>
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

--===============3042299404721856293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev4)
URL   : https://patchwork.freedesktop.org/series/130530/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7754_BAT -> XEIGTPW_10806_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7754 -> IGTPW_10806
  * Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -> xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad

  IGTPW_10806: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10806/index.html
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10806/index.html

--===============3042299404721856293==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130530/">https://patchwork.freedesktop.org/series/130530/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10806/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10806/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7754_BAT -&gt; XEIGTPW_10806_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7754 -&gt; IGTPW_10806</li>
<li>Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -&gt; xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad</li>
</ul>
<p>IGTPW_10806: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10806/index.html<br />
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54<br />
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad</p>

</body>
</html>

--===============3042299404721856293==--
