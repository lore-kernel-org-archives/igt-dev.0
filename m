Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5B2FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 21:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03F610E011;
	Mon,  4 May 2026 21:29:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34CB10E011;
 Mon,  4 May 2026 21:29:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6350322834367409018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=5Fresid?=
 =?utf-8?q?ency=3A_skip_cpg-gt-toggle_if_GT_not_in_C6?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 May 2026 21:29:26 -0000
Message-ID: <177793016692.37012.1434018814043273166@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504202840.2572025-2-sk.anirban@intel.com>
In-Reply-To: <20260504202840.2572025-2-sk.anirban@intel.com>
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

--===============6350322834367409018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not in C6
URL   : https://patchwork.freedesktop.org/series/165933/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8883_BAT -> XEIGTPW_15096_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15096_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8883/bat-atsm-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15096/bat-atsm-2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8883 -> IGTPW_15096
  * Linux: xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5 -> xe-4980-190806bad83a94cee94343c1e937c8447046976b

  IGTPW_15096: f16ad105ac20341f924d9118d0ab0d917129cc73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5
  xe-4980-190806bad83a94cee94343c1e937c8447046976b: 190806bad83a94cee94343c1e937c8447046976b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15096/index.html

--===============6350322834367409018==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not in C6</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165933/">https://patchwork.freedesktop.org/series/165933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15096/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15096/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8883_BAT -&gt; XEIGTPW_15096_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15096_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8883/bat-atsm-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15096/bat-atsm-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8883 -&gt; IGTPW_15096</li>
<li>Linux: xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5 -&gt; xe-4980-190806bad83a94cee94343c1e937c8447046976b</li>
</ul>
<p>IGTPW_15096: f16ad105ac20341f924d9118d0ab0d917129cc73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5<br />
  xe-4980-190806bad83a94cee94343c1e937c8447046976b: 190806bad83a94cee94343c1e937c8447046976b</p>

</body>
</html>

--===============6350322834367409018==--
