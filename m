Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED80DC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 21:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF4F112CB1;
	Mon, 11 Mar 2024 21:57:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764B112CB1;
 Mon, 11 Mar 2024 21:57:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8482973031207137638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_scripts/xls=5Fto=5Fdoc=2Epy=3A?=
 =?utf-8?q?_use_a_main=28=29_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 11 Mar 2024 21:57:54 -0000
Message-ID: <171019427468.681939.5940597104380721637@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311130220.982606-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240311130220.982606-1-mauro.chehab@linux.intel.com>
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

--===============8482973031207137638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/xls_to_doc.py: use a main() function
URL   : https://patchwork.freedesktop.org/series/130981/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7754_BAT -> XEIGTPW_10804_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10804_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1238])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7754/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10804/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7754 -> IGTPW_10804
  * Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -> xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad

  IGTPW_10804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10804/index.html
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10804/index.html

--===============8482973031207137638==
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
<tr><td><b>Series:</b></td><td>scripts/xls_to_doc.py: use a main() function</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130981/">https://patchwork.freedesktop.org/series/130981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10804/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10804/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7754_BAT -&gt; XEIGTPW_10804_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10804_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7754/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10804/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7754 -&gt; IGTPW_10804</li>
<li>Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -&gt; xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad</li>
</ul>
<p>IGTPW_10804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10804/index.html<br />
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54<br />
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad</p>

</body>
</html>

--===============8482973031207137638==--
