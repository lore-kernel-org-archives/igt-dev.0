Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E64C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3E410E0A7;
	Wed, 21 Aug 2024 14:56:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140310E0A7;
 Wed, 21 Aug 2024 14:56:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6067928270022840974=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_compilation_for_musl_in_in?=
 =?utf-8?q?tel/kms=5Fpm=5Fbacklight?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Aug 2024 14:56:27 -0000
Message-ID: <172425218798.721792.15146203503205324351@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
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

--===============6067928270022840974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix compilation for musl in intel/kms_pm_backlight
URL   : https://patchwork.freedesktop.org/series/137557/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7981_BAT -> XEIGTPW_11609_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11609_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#1069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_7981 -> IGTPW_11609
  * Linux: xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c -> xe-1804-c83ab549ef8f647c3de42793d222a980021a973f

  IGTPW_11609: 11609
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c: 50db4c0a8d28ec0d03ea120d17a914265fa47d5c
  xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: c83ab549ef8f647c3de42793d222a980021a973f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/index.html

--===============6067928270022840974==
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
<tr><td><b>Series:</b></td><td>Fix compilation for musl in intel/kms_pm_backlight</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137557/">https://patchwork.freedesktop.org/series/137557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7981_BAT -&gt; XEIGTPW_11609_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11609_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_reset@cm-close-fd-no-exec:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7981/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11609/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7981 -&gt; IGTPW_11609</li>
<li>Linux: xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c -&gt; xe-1804-c83ab549ef8f647c3de42793d222a980021a973f</li>
</ul>
<p>IGTPW_11609: 11609<br />
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c: 50db4c0a8d28ec0d03ea120d17a914265fa47d5c<br />
  xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: c83ab549ef8f647c3de42793d222a980021a973f</p>

</body>
</html>

--===============6067928270022840974==--
