Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9870D19502
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 16:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8110E44B;
	Mon, 26 Jan 2026 16:54:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D1610E44B;
 Mon, 26 Jan 2026 16:54:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7112453999338138201=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_=22tests/xe=5Frender?=
 =?utf-8?q?=5Fcopy=3A_Skip_if_platform_doesn=27t_support_flatccs=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jan 2026 16:54:48 -0000
Message-ID: <176944648880.193343.5168118678822518765@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
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

--===============7112453999338138201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "tests/xe_render_copy: Skip if platform doesn't support flatccs"
URL   : https://patchwork.freedesktop.org/series/160643/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8717_BAT -> XEIGTPW_14417_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8717 -> IGTPW_14417
  * Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -> xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc

  IGTPW_14417: 14417
  IGT_8717: 8717
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b
  xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc: 0f7122915dfd558c57f69c4f97ebd64707a721cc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14417/index.html

--===============7112453999338138201==
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
<tr><td><b>Series:</b></td><td>Revert &quot;tests/xe_render_copy: Skip if platform doesn&#x27;t support flatccs&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160643/">https://patchwork.freedesktop.org/series/160643/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14417/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14417/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8717_BAT -&gt; XEIGTPW_14417_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8717 -&gt; IGTPW_14417</li>
<li>Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -&gt; xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc</li>
</ul>
<p>IGTPW_14417: 14417<br />
  IGT_8717: 8717<br />
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b<br />
  xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc: 0f7122915dfd558c57f69c4f97ebd64707a721cc</p>

</body>
</html>

--===============7112453999338138201==--
