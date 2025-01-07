Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C16E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 23:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537010E041;
	Tue,  7 Jan 2025 23:17:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491B310E041;
 Tue,  7 Jan 2025 23:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7835116145232288285=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Update_image_assets_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jan 2025 23:17:34 -0000
Message-ID: <173629185429.1074563.11083104785254056162@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
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

--===============7835116145232288285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update image assets (rev3)
URL   : https://patchwork.freedesktop.org/series/141539/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8179_BAT -> XEIGTPW_12397_BAT
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

  Here are the changes found in XEIGTPW_12397_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#540])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-adlp-vf/igt@kms_3d.html
    - bat-lnl-1:          NOTRUN -> [SKIP][2] ([Intel XE#1465])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-lnl-1/igt@kms_3d.html
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#540])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-pvc-2/igt@kms_3d.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#540])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-atsm-2/igt@kms_3d.html
    - bat-lnl-2:          NOTRUN -> [SKIP][5] ([Intel XE#1465])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-lnl-2/igt@kms_3d.html

  
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_8179 -> IGTPW_12397
  * Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -> xe-2451-dbd476153d41352ad6022088be16301051b9bce7

  IGTPW_12397: d4aedc2fc073d7761e5bff52b7486f9184fb49ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571
  xe-2451-dbd476153d41352ad6022088be16301051b9bce7: dbd476153d41352ad6022088be16301051b9bce7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/index.html

--===============7835116145232288285==
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
<tr><td><b>Series:</b></td><td>Update image assets (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141539/">https://patchwork.freedesktop.org/series/141539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8179_BAT -&gt; XEIGTPW_12397_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12397_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-adlp-vf/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-pvc-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-atsm-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12397/bat-lnl-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8179 -&gt; IGTPW_12397</li>
<li>Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -&gt; xe-2451-dbd476153d41352ad6022088be16301051b9bce7</li>
</ul>
<p>IGTPW_12397: d4aedc2fc073d7761e5bff52b7486f9184fb49ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571<br />
  xe-2451-dbd476153d41352ad6022088be16301051b9bce7: dbd476153d41352ad6022088be16301051b9bce7</p>

</body>
</html>

--===============7835116145232288285==--
