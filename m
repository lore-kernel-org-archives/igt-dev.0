Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F87C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 15:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8D510E5D6;
	Tue,  1 Apr 2025 15:26:48 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B83910E5D6;
 Tue,  1 Apr 2025 15:26:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7187569126019685289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Stress_copy_engines_during_?=
 =?utf-8?q?render_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Apr 2025 15:26:47 -0000
Message-ID: <174352120736.23500.13083961617811010770@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401140510.38142-1-francois.dugast@intel.com>
In-Reply-To: <20250401140510.38142-1-francois.dugast@intel.com>
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

--===============7187569126019685289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stress copy engines during render (rev6)
URL   : https://patchwork.freedesktop.org/series/145831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8297_BAT -> XEIGTPW_12898_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12898
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2890-2b5616d699e52553398fd5a2736646ad59716bee

  IGTPW_12898: 12898
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2890-2b5616d699e52553398fd5a2736646ad59716bee: 2b5616d699e52553398fd5a2736646ad59716bee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/index.html

--===============7187569126019685289==
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
<tr><td><b>Series:</b></td><td>Stress copy engines during render (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145831/">https://patchwork.freedesktop.org/series/145831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_BAT -&gt; XEIGTPW_12898_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12898</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2890-2b5616d699e52553398fd5a2736646ad59716bee</li>
</ul>
<p>IGTPW_12898: 12898<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201<br />
  xe-2890-2b5616d699e52553398fd5a2736646ad59716bee: 2b5616d699e52553398fd5a2736646ad59716bee</p>

</body>
</html>

--===============7187569126019685289==--
