Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1732BC88E6F
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 19:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9929510E15B;
	Mon, 14 Sep 2026 19:13:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE810E15B;
 Mon, 14 Sep 2026 19:13:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0792693805793522182=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcolor=3A_Add_su?=
 =?utf-8?q?pport_for_background_color_testing=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Sep 2026 19:13:07 -0000
Message-ID: <178941318768.159192.11608040939482477038@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
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

--===============0792693805793522182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add support for background color testing. (rev4)
URL   : https://patchwork.freedesktop.org/series/167119/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9094_BAT -> XEIGTPW_15840_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15840_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][1] ([Intel XE#9109]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * IGT: IGT_9094 -> IGTPW_15840
  * Linux: xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797 -> xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0

  IGTPW_15840: 15840
  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797: 7d3acf4579249aa2d991192f3452017a3d72b797
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/index.html

--===============0792693805793522182==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add support for background color testing. (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167119/">https://patchwork.freedesktop.org/series/167119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9094_BAT -&gt; XEIGTPW_15840_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15840_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9094 -&gt; IGTPW_15840</li>
<li>Linux: xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797 -&gt; xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0</li>
</ul>
<p>IGTPW_15840: 15840<br />
  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797: 7d3acf4579249aa2d991192f3452017a3d72b797<br />
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0</p>

</body>
</html>

--===============0792693805793522182==--
