Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAF4C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 19:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA010E357;
	Mon, 16 Jun 2025 19:50:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CAF10E317;
 Mon, 16 Jun 2025 19:50:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5146119614607090914=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Replace_intel=5Fsysfs=5Fdeb?=
 =?utf-8?q?ugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Jun 2025 19:50:22 -0000
Message-ID: <175010342299.83004.8200236814982465854@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
In-Reply-To: <20250616074240.45818-1-peter.senna@linux.intel.com>
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

--===============5146119614607090914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace intel_sysfs_debugfs
URL   : https://patchwork.freedesktop.org/series/150310/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8412_BAT -> XEIGTPW_13300_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8412_BAT and XEIGTPW_13300_BAT:

### New IGT tests (4) ###

  * igt@core_debugfs@read-all-entries:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.12] s

  * igt@core_sysfs@read-all-entries:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@xe-base:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@xe_debugfs@xe-forcewake:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8412 -> IGTPW_13300
  * Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -> xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96

  IGTPW_13300: 13300
  IGT_8412: 8412
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76
  xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96: 43ac07d088f280cfb9eeda0c4caf11b0b7b56e96

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13300/index.html

--===============5146119614607090914==
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
<tr><td><b>Series:</b></td><td>Replace intel_sysfs_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150310/">https://patchwork.freedesktop.org/series/150310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13300/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13300/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8412_BAT -&gt; XEIGTPW_13300_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8412_BAT and XEIGTPW_13300_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@core_sysfs@read-all-entries:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-base:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-forcewake:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8412 -&gt; IGTPW_13300</li>
<li>Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -&gt; xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96</li>
</ul>
<p>IGTPW_13300: 13300<br />
  IGT_8412: 8412<br />
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76<br />
  xe-3256-43ac07d088f280cfb9eeda0c4caf11b0b7b56e96: 43ac07d088f280cfb9eeda0c4caf11b0b7b56e96</p>

</body>
</html>

--===============5146119614607090914==--
