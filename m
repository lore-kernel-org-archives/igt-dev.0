Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D1EC87FCF
	for <igt-dev@archiver.kernel.org>; Sat,  9 Aug 2025 14:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7A10E04A;
	Sat,  9 Aug 2025 14:11:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB010E04A;
 Sat,  9 Aug 2025 14:11:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1485213458980583987=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fdir=3A_Use_actual?=
 =?utf-8?q?_length_for_string_termination?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 09 Aug 2025 14:11:50 -0000
Message-ID: <175474871006.224735.3870075516834268418@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250809131858.71685-1-peter.senna@linux.intel.com>
In-Reply-To: <20250809131858.71685-1-peter.senna@linux.intel.com>
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

--===============1485213458980583987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_dir: Use actual length for string termination
URL   : https://patchwork.freedesktop.org/series/152724/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8489_BAT -> XEIGTPW_13564_BAT
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

  Here are the changes found in XEIGTPW_13564_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8489 -> IGTPW_13564
  * Linux: xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef -> xe-3521-5e2776589ef98e25137723141a47efc3f977e406

  IGTPW_13564: 13564
  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f0a66ce76ce8d21aef
  xe-3521-5e2776589ef98e25137723141a47efc3f977e406: 5e2776589ef98e25137723141a47efc3f977e406

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/index.html

--===============1485213458980583987==
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
<tr><td><b>Series:</b></td><td>lib/igt_dir: Use actual length for string termination</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152724/">https://patchwork.freedesktop.org/series/152724/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8489_BAT -&gt; XEIGTPW_13564_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13564_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8489/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13564/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8489 -&gt; IGTPW_13564</li>
<li>Linux: xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef -&gt; xe-3521-5e2776589ef98e25137723141a47efc3f977e406</li>
</ul>
<p>IGTPW_13564: 13564<br />
  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f0a66ce76ce8d21aef<br />
  xe-3521-5e2776589ef98e25137723141a47efc3f977e406: 5e2776589ef98e25137723141a47efc3f977e406</p>

</body>
</html>

--===============1485213458980583987==--
