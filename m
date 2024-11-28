Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E62D70DEE
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 20:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A7A10E4A0;
	Thu, 28 Nov 2024 20:59:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6910E4A0;
 Thu, 28 Nov 2024 20:59:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2659626668167532303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Finvalid=5Fmode?=
 =?utf-8?q?=3A_Attempt_divide-by-zero_in_drm=5Fmode=5Fvrefresh=28=29_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 20:59:42 -0000
Message-ID: <173282758202.42531.17401783556529752790@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
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

--===============2659626668167532303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh() (rev2)
URL   : https://patchwork.freedesktop.org/series/141836/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8130_BAT -> XEIGTPW_12217_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8130 -> IGTPW_12217
  * Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -> xe-2292-2ad46928583b63ad6dc40ef74dfdac2d3125f3c8

  IGTPW_12217: 47770ec3ce7e646b821666d2dd925d30edd577c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b
  xe-2292-2ad46928583b63ad6dc40ef74dfdac2d3125f3c8: 2ad46928583b63ad6dc40ef74dfdac2d3125f3c8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12217/index.html

--===============2659626668167532303==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141836/">https://patchwork.freedesktop.org/series/141836/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12217/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12217/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8130_BAT -&gt; XEIGTPW_12217_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8130 -&gt; IGTPW_12217</li>
<li>Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -&gt; xe-2292-2ad46928583b63ad6dc40ef74dfdac2d3125f3c8</li>
</ul>
<p>IGTPW_12217: 47770ec3ce7e646b821666d2dd925d30edd577c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b<br />
  xe-2292-2ad46928583b63ad6dc40ef74dfdac2d3125f3c8: 2ad46928583b63ad6dc40ef74dfdac2d3125f3c8</p>

</body>
</html>

--===============2659626668167532303==--
