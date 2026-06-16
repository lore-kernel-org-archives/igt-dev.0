Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1998CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 14:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C08510E7C6;
	Tue, 16 Jun 2026 14:59:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C3510E1E6;
 Tue, 16 Jun 2026 14:59:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0232960824699757088=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_tests/kms=5Fbw=3A_use_igt=5Fdisplay=5Fn=5Fcrtcs=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Jun 2026 14:59:04 -0000
Message-ID: <178162194494.85071.7242417002140309194@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616090610.2106378-1-jani.nikula@intel.com>
In-Reply-To: <20260616090610.2106378-1-jani.nikula@intel.com>
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

--===============0232960824699757088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/kms_bw: use igt_display_n_crtcs()
URL   : https://patchwork.freedesktop.org/series/168585/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8966_BAT -> XEIGTPW_15376_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8966 -> IGTPW_15376
  * Linux: xe-5263-70a7fd18b5ca499b6eaca60f303240e8e8763113 -> xe-5264-70646d7ea3ac559ed269c0a38cd3699fea4e1eeb

  IGTPW_15376: c3d86d89c7005d74aa5531726856f83b75dba104 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5263-70a7fd18b5ca499b6eaca60f303240e8e8763113: 70a7fd18b5ca499b6eaca60f303240e8e8763113
  xe-5264-70646d7ea3ac559ed269c0a38cd3699fea4e1eeb: 70646d7ea3ac559ed269c0a38cd3699fea4e1eeb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15376/index.html

--===============0232960824699757088==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/kms_bw: use igt_display_n_crtcs()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168585/">https://patchwork.freedesktop.org/series/168585/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15376/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15376/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8966_BAT -&gt; XEIGTPW_15376_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8966 -&gt; IGTPW_15376</li>
<li>Linux: xe-5263-70a7fd18b5ca499b6eaca60f303240e8e8763113 -&gt; xe-5264-70646d7ea3ac559ed269c0a38cd3699fea4e1eeb</li>
</ul>
<p>IGTPW_15376: c3d86d89c7005d74aa5531726856f83b75dba104 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5263-70a7fd18b5ca499b6eaca60f303240e8e8763113: 70a7fd18b5ca499b6eaca60f303240e8e8763113<br />
  xe-5264-70646d7ea3ac559ed269c0a38cd3699fea4e1eeb: 70646d7ea3ac559ed269c0a38cd3699fea4e1eeb</p>

</body>
</html>

--===============0232960824699757088==--
