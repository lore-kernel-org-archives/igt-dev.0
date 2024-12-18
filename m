Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB592E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657CE10E012;
	Wed, 18 Dec 2024 14:15:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8648A10E012;
 Wed, 18 Dec 2024 14:15:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4061911290213277928=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdebugfs=3A?=
 =?utf-8?q?_Extend_gt_test_to_check_few_debugfs_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 14:15:23 -0000
Message-ID: <173453132354.69589.7819049030872498034@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
In-Reply-To: <20241217135659.673564-1-pravalika.gurram@intel.com>
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

--===============4061911290213277928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_debugfs: Extend gt test to check few debugfs entries
URL   : https://patchwork.freedesktop.org/series/142724/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8162_BAT -> XEIGTPW_12335_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8162 -> IGTPW_12335

  IGTPW_12335: 09382564ea2522b583cd1692bd32e6af7a113ebe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12335/index.html

--===============4061911290213277928==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_debugfs: Extend gt test to check few debugfs entries</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142724/">https://patchwork.freedesktop.org/series/142724/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12335/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12335/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8162_BAT -&gt; XEIGTPW_12335_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8162 -&gt; IGTPW_12335</li>
</ul>
<p>IGTPW_12335: 09382564ea2522b583cd1692bd32e6af7a113ebe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c</p>

</body>
</html>

--===============4061911290213277928==--
