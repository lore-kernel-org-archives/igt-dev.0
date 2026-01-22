Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A431C44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 07:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7F10E1F3;
	Thu, 22 Jan 2026 07:13:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD0310E28B;
 Thu, 22 Jan 2026 07:13:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4299593709925551809=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Close_any_open_drm_device_a?=
 =?utf-8?q?fter_engine_initialization_in_GPUTOP_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jan 2026 07:13:14 -0000
Message-ID: <176906599471.181791.12324729763666262842@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122063702.524450-1-soham.purkait@intel.com>
In-Reply-To: <20260122063702.524450-1-soham.purkait@intel.com>
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

--===============4299593709925551809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Close any open drm device after engine initialization in GPUTOP (rev6)
URL   : https://patchwork.freedesktop.org/series/158161/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8711_BAT -> XEIGTPW_14393_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8711 -> IGTPW_14393
  * Linux: xe-4432-ad2a046603cba140214aed34015ed5027441e85a -> xe-4433-40800011414446888105f6beae6dd3fac56516aa

  IGTPW_14393: 14393
  IGT_8711: 38428617bae65b39b306f79217ac922ebee3b477 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4432-ad2a046603cba140214aed34015ed5027441e85a: ad2a046603cba140214aed34015ed5027441e85a
  xe-4433-40800011414446888105f6beae6dd3fac56516aa: 40800011414446888105f6beae6dd3fac56516aa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14393/index.html

--===============4299593709925551809==
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
<tr><td><b>Series:</b></td><td>Close any open drm device after engine initialization in GPUTOP (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158161/">https://patchwork.freedesktop.org/series/158161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14393/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14393/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8711_BAT -&gt; XEIGTPW_14393_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8711 -&gt; IGTPW_14393</li>
<li>Linux: xe-4432-ad2a046603cba140214aed34015ed5027441e85a -&gt; xe-4433-40800011414446888105f6beae6dd3fac56516aa</li>
</ul>
<p>IGTPW_14393: 14393<br />
  IGT_8711: 38428617bae65b39b306f79217ac922ebee3b477 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4432-ad2a046603cba140214aed34015ed5027441e85a: ad2a046603cba140214aed34015ed5027441e85a<br />
  xe-4433-40800011414446888105f6beae6dd3fac56516aa: 40800011414446888105f6beae6dd3fac56516aa</p>

</body>
</html>

--===============4299593709925551809==--
