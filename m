Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE922E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 22:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1110E079;
	Fri, 20 Dec 2024 22:32:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4E110E079;
 Fri, 20 Dec 2024 22:32:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6373530432839233315=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/3=5D_lib/igt=5Fkmod=3A_fix_check_to_confirm_correct_d?=
 =?utf-8?q?river_unload?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 22:32:50 -0000
Message-ID: <173473397005.939609.15354713430374559389@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
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

--===============6373530432839233315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/3] lib/igt_kmod: fix check to confirm correct driver unload
URL   : https://patchwork.freedesktop.org/series/142889/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8172_BAT -> XEIGTPW_12362_BAT
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

  Here are the changes found in XEIGTPW_12362_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#1033]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12362/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033


Build changes
-------------

  * IGT: IGT_8172 -> IGTPW_12362
  * Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -> xe-2413-0eede13975362b755a208b2e2ba322940013f183

  IGTPW_12362: 41a3f720c995fee32893b2af2c6d587848fb9d7b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077
  xe-2413-0eede13975362b755a208b2e2ba322940013f183: 0eede13975362b755a208b2e2ba322940013f183

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12362/index.html

--===============6373530432839233315==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/3] lib/igt_kmod: fix check to confirm correct driver unload</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142889/">https://patchwork.freedesktop.org/series/142889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12362/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8172_BAT -&gt; XEIGTPW_12362_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12362_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8172/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12362/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8172 -&gt; IGTPW_12362</li>
<li>Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -&gt; xe-2413-0eede13975362b755a208b2e2ba322940013f183</li>
</ul>
<p>IGTPW_12362: 41a3f720c995fee32893b2af2c6d587848fb9d7b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077<br />
  xe-2413-0eede13975362b755a208b2e2ba322940013f183: 0eede13975362b755a208b2e2ba322940013f183</p>

</body>
</html>

--===============6373530432839233315==--
