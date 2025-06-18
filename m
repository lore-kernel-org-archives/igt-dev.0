Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00C3C7115B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 04:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634EA10E186;
	Wed, 18 Jun 2025 04:29:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38010E186;
 Wed, 18 Jun 2025 04:29:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0562685929111712430=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe=5Fquery=3A_Fix_doc_s?=
 =?utf-8?q?tring_for_xe=5Fdevice-=3Ememory=5Fregions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jun 2025 04:29:40 -0000
Message-ID: <175022098063.89783.13117486016949209965@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617225213.43226-2-matthew.d.roper@intel.com>
In-Reply-To: <20250617225213.43226-2-matthew.d.roper@intel.com>
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

--===============0562685929111712430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_query: Fix doc string for xe_device->memory_regions
URL   : https://patchwork.freedesktop.org/series/150416/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8414_BAT -> XEIGTPW_13316_BAT
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

  * IGT: IGT_8414 -> IGTPW_13316
  * Linux: xe-3266-ec86132a383e84e0acd73092030b8d1b51c70060 -> xe-3270-ea25a853bb074de19bf66bbd9d0ccc891425fce6

  IGTPW_13316: 59a37c5799682a4257bef1226cabbb936425f444 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8414: 8414
  xe-3266-ec86132a383e84e0acd73092030b8d1b51c70060: ec86132a383e84e0acd73092030b8d1b51c70060
  xe-3270-ea25a853bb074de19bf66bbd9d0ccc891425fce6: ea25a853bb074de19bf66bbd9d0ccc891425fce6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13316/index.html

--===============0562685929111712430==
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
<tr><td><b>Series:</b></td><td>lib/xe_query: Fix doc string for xe_device-&gt;memory_regions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150416/">https://patchwork.freedesktop.org/series/150416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13316/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13316/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8414_BAT -&gt; XEIGTPW_13316_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8414 -&gt; IGTPW_13316</li>
<li>Linux: xe-3266-ec86132a383e84e0acd73092030b8d1b51c70060 -&gt; xe-3270-ea25a853bb074de19bf66bbd9d0ccc891425fce6</li>
</ul>
<p>IGTPW_13316: 59a37c5799682a4257bef1226cabbb936425f444 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8414: 8414<br />
  xe-3266-ec86132a383e84e0acd73092030b8d1b51c70060: ec86132a383e84e0acd73092030b8d1b51c70060<br />
  xe-3270-ea25a853bb074de19bf66bbd9d0ccc891425fce6: ea25a853bb074de19bf66bbd9d0ccc891425fce6</p>

</body>
</html>

--===============0562685929111712430==--
