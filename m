Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263E6D75E2A
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 11:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEC210E28D;
	Fri, 22 Nov 2024 11:35:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB5C10E28D;
 Fri, 22 Nov 2024 11:35:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5033956769978845778=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gputop=3A_Add_memory_only_u?=
 =?utf-8?q?tilization_type?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christian Gmeiner" <christian.gmeiner@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 11:35:18 -0000
Message-ID: <173227531880.1672186.4792474542115039257@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
In-Reply-To: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
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

--===============5033956769978845778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gputop: Add memory only utilization type
URL   : https://patchwork.freedesktop.org/series/141689/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8122_BAT -> XEIGTPW_12174_BAT
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

  Here are the changes found in XEIGTPW_12174_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8122/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12174/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * IGT: IGT_8122 -> IGTPW_12174
  * Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -> xe-2261-d571d186fd9e588dd4acdbbde1fb0935b84c233a

  IGTPW_12174: 12174
  IGT_8122: 8122
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199
  xe-2261-d571d186fd9e588dd4acdbbde1fb0935b84c233a: d571d186fd9e588dd4acdbbde1fb0935b84c233a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12174/index.html

--===============5033956769978845778==
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
<tr><td><b>Series:</b></td><td>gputop: Add memory only utilization type</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141689/">https://patchwork.freedesktop.org/series/141689/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12174/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12174/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8122_BAT -&gt; XEIGTPW_12174_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12174_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8122/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12174/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8122 -&gt; IGTPW_12174</li>
<li>Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -&gt; xe-2261-d571d186fd9e588dd4acdbbde1fb0935b84c233a</li>
</ul>
<p>IGTPW_12174: 12174<br />
  IGT_8122: 8122<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199<br />
  xe-2261-d571d186fd9e588dd4acdbbde1fb0935b84c233a: d571d186fd9e588dd4acdbbde1fb0935b84c233a</p>

</body>
</html>

--===============5033956769978845778==--
