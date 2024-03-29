Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D35C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 10:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFD410EA00;
	Fri, 29 Mar 2024 10:58:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1EF10EA00;
 Fri, 29 Mar 2024 10:58:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7986188661041017799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Ffb=3A_fix_intel_modi?=
 =?utf-8?q?fiers_for_fb_copying_on_xe_driver_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Mar 2024 10:58:03 -0000
Message-ID: <171170988344.1081091.12352392416027532996@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328142542.79809-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240328142542.79809-1-juhapekka.heikkila@gmail.com>
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

--===============7986188661041017799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: fix intel modifiers for fb copying on xe driver (rev6)
URL   : https://patchwork.freedesktop.org/series/131490/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7790_BAT -> XEIGTPW_10951_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10951_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415


Build changes
-------------

  * IGT: IGT_7790 -> IGTPW_10951
  * Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -> xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a

  IGTPW_10951: 10951
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8
  xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a: d80d79a49622684f7d0c29e26354fa55c718b48a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10951/index.html

--===============7986188661041017799==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: fix intel modifiers for fb copying on xe driver (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131490/">https://patchwork.freedesktop.org/series/131490/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10951/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10951/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7790_BAT -&gt; XEIGTPW_10951_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10951_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7790 -&gt; IGTPW_10951</li>
<li>Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -&gt; xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a</li>
</ul>
<p>IGTPW_10951: 10951<br />
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8<br />
  xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a: d80d79a49622684f7d0c29e26354fa55c718b48a</p>

</body>
</html>

--===============7986188661041017799==--
