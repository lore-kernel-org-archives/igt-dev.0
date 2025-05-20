Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03F0C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 21:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A810E575;
	Tue, 20 May 2025 21:00:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4710E575;
 Tue, 20 May 2025 21:00:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7195076057507503169=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Update_image_assets_=28rev6?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 May 2025 21:00:25 -0000
Message-ID: <174777482526.6224.6308314649340909315@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
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

--===============7195076057507503169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update image assets (rev6)
URL   : https://patchwork.freedesktop.org/series/141539/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8371_BAT -> XEIGTPW_13154_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13154_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - bat-lnl-1:          NOTRUN -> [SKIP][1] ([Intel XE#1465])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-lnl-1/igt@kms_3d.html
    - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#540])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-pvc-2/igt@kms_3d.html
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#540])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-atsm-2/igt@kms_3d.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#1465])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-lnl-2/igt@kms_3d.html

  
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_8371 -> IGTPW_13154
  * Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -> xe-3116-45abc70af791052c25beeb400aece4dab51020cd

  IGTPW_13154: 13154
  IGT_8371: 8371
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/index.html

--===============7195076057507503169==
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
<tr><td><b>Series:</b></td><td>Update image assets (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141539/">https://patchwork.freedesktop.org/series/141539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8371_BAT -&gt; XEIGTPW_13154_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13154_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-pvc-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-atsm-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13154/bat-lnl-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8371 -&gt; IGTPW_13154</li>
<li>Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -&gt; xe-3116-45abc70af791052c25beeb400aece4dab51020cd</li>
</ul>
<p>IGTPW_13154: 13154<br />
  IGT_8371: 8371<br />
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320<br />
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd</p>

</body>
</html>

--===============7195076057507503169==--
