Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544EEC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07DF10EE18;
	Thu,  1 Feb 2024 14:09:22 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140410EE18;
 Thu,  1 Feb 2024 14:09:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7087396531041218783=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/rendercopy=5Fgen9=3A_Fix_X?=
 =?utf-8?q?e2_missing_pixels_on_non-modulo-16_surfaces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Feb 2024 14:09:21 -0000
Message-ID: <170679656198.895526.4113096200887242828@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201130904.388276-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240201130904.388276-1-zbigniew.kempczynski@intel.com>
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

--===============7087396531041218783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy_gen9: Fix Xe2 missing pixels on non-modulo-16 surfaces
URL   : https://patchwork.freedesktop.org/series/129417/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7700_BAT -> XEIGTPW_10624_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10624_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7700/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10624/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7700 -> IGTPW_10624
  * Linux: xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 -> xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde

  IGTPW_10624: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10624/index.html
  IGT_7700: 7700
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10624/index.html

--===============7087396531041218783==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy_gen9: Fix Xe2 missing pixels on non-modulo-16 surfaces</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129417/">https://patchwork.freedesktop.org/series/129417/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10624/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10624/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7700_BAT -&gt; XEIGTPW_10624_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10624_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7700/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10624/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7700 -&gt; IGTPW_10624</li>
<li>Linux: xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 -&gt; xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde</li>
</ul>
<p>IGTPW_10624: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10624/index.html<br />
  IGT_7700: 7700<br />
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030<br />
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde</p>

</body>
</html>

--===============7087396531041218783==--
