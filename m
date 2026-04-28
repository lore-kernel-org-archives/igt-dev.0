Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1779CFF886D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 18:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F83010E360;
	Tue, 28 Apr 2026 18:23:47 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5982210E33B;
 Tue, 28 Apr 2026 18:23:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4216205407977110569=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests=5Cintel=5Cxe=5Fconfig?=
 =?utf-8?q?fs=3A_Fix_ctx=5Frestore_BB_path_for_post_and_mid_variants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Apr 2026 18:23:33 -0000
Message-ID: <177740061331.22650.8459724126672667248@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
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

--===============4216205407977110569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests\intel\xe_configfs: Fix ctx_restore BB path for post and mid variants
URL   : https://patchwork.freedesktop.org/series/165621/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8875_BAT -> XEIGTPW_15075_BAT
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

  * IGT: IGT_8875 -> IGTPW_15075

  IGTPW_15075: 87802928222530a0b766cba19aac1d2025cd059b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8875: 5f5503b3bd1939fa733df60df7a6bf2b2101ee5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4946-e066eb26712bca7174e694a358351c50a38661d6: e066eb26712bca7174e694a358351c50a38661d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15075/index.html

--===============4216205407977110569==
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
<tr><td><b>Series:</b></td><td>tests\intel\xe_configfs: Fix ctx_restore BB path for post and mid variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165621/">https://patchwork.freedesktop.org/series/165621/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15075/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15075/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8875_BAT -&gt; XEIGTPW_15075_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8875 -&gt; IGTPW_15075</li>
</ul>
<p>IGTPW_15075: 87802928222530a0b766cba19aac1d2025cd059b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8875: 5f5503b3bd1939fa733df60df7a6bf2b2101ee5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4946-e066eb26712bca7174e694a358351c50a38661d6: e066eb26712bca7174e694a358351c50a38661d6</p>

</body>
</html>

--===============4216205407977110569==--
