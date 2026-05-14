Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D5CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 07:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3F10E38C;
	Thu, 14 May 2026 07:38:00 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26B210E38C;
 Thu, 14 May 2026 07:37:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5887929302566039804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fwa=3A_Assert_on?=
 =?utf-8?q?_error_instead_of_returning_-1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 May 2026 07:37:41 -0000
Message-ID: <177874426172.71182.7294261346424705449@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
In-Reply-To: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
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

--===============5887929302566039804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_wa: Assert on error instead of returning -1
URL   : https://patchwork.freedesktop.org/series/166558/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8911_BAT -> XEIGTPW_15183_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8911 -> IGTPW_15183

  IGTPW_15183: 8c06dc420933d6e73f9bd4f7cad0f4281e94ad0c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8911: c7f4a459bf125a487220a0b56f5f17cc0721c541 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15183/index.html

--===============5887929302566039804==
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
<tr><td><b>Series:</b></td><td>lib/intel_wa: Assert on error instead of returning -1</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166558/">https://patchwork.freedesktop.org/series/166558/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15183/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15183/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8911_BAT -&gt; XEIGTPW_15183_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8911 -&gt; IGTPW_15183</li>
</ul>
<p>IGTPW_15183: 8c06dc420933d6e73f9bd4f7cad0f4281e94ad0c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8911: c7f4a459bf125a487220a0b56f5f17cc0721c541 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976</p>

</body>
</html>

--===============5887929302566039804==--
