Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B7C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 23:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723EE10E990;
	Thu, 10 Jul 2025 23:34:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783A410E98E;
 Thu, 10 Jul 2025 23:34:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5587200949103458260=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fkms=3A_Update_igt?=
 =?utf-8?q?=5Ffit=5Fmodes=5Fin=5Fbw_to_add_legacy_commit_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Jul 2025 23:34:28 -0000
Message-ID: <175219046848.152706.14962134663569293211@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710194643.977386-1-karthik.b.s@intel.com>
In-Reply-To: <20250710194643.977386-1-karthik.b.s@intel.com>
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

--===============5587200949103458260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Update igt_fit_modes_in_bw to add legacy commit check
URL   : https://patchwork.freedesktop.org/series/151461/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8451_BAT -> XEIGTPW_13448_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in XEIGTPW_13448_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13448/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8451 -> IGTPW_13448
  * Linux: xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03 -> xe-3393-0c25b3078b7b218b4a529dc6497fe4804aecb842

  IGTPW_13448: 1dbf43134f7b8396fe0bf8f6730753eaeeab7cbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8451: 8451
  xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03: ad02e528d11b8cdc56daaa647aed319ba1d1ff03
  xe-3393-0c25b3078b7b218b4a529dc6497fe4804aecb842: 0c25b3078b7b218b4a529dc6497fe4804aecb842

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13448/index.html

--===============5587200949103458260==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Update igt_fit_modes_in_bw to add legacy commit check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151461/">https://patchwork.freedesktop.org/series/151461/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13448/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13448/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8451_BAT -&gt; XEIGTPW_13448_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13448_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13448/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8451 -&gt; IGTPW_13448</li>
<li>Linux: xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03 -&gt; xe-3393-0c25b3078b7b218b4a529dc6497fe4804aecb842</li>
</ul>
<p>IGTPW_13448: 1dbf43134f7b8396fe0bf8f6730753eaeeab7cbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8451: 8451<br />
  xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03: ad02e528d11b8cdc56daaa647aed319ba1d1ff03<br />
  xe-3393-0c25b3078b7b218b4a529dc6497fe4804aecb842: 0c25b3078b7b218b4a529dc6497fe4804aecb842</p>

</body>
</html>

--===============5587200949103458260==--
