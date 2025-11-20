Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333EECF884C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 12:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC80D10E294;
	Thu, 20 Nov 2025 12:26:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3542C10E294;
 Thu, 20 Nov 2025 12:26:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4956562683717206260=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Update_sharpness_filter_tes?=
 =?utf-8?q?t_and_related_CI_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Nov 2025 12:26:47 -0000
Message-ID: <176364160721.13718.1075514957547882035@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120103532.1055144-1-swati2.sharma@intel.com>
In-Reply-To: <20251120103532.1055144-1-swati2.sharma@intel.com>
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

--===============4956562683717206260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update sharpness filter test and related CI changes
URL   : https://patchwork.freedesktop.org/series/157833/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8635_BAT -> XEIGTPW_14086_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14086_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14086_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_14086_BAT prevented too many machines from booting.

  Missing    (12): bat-bmg-1 bat-pvc-2 bat-lnl-2 bat-lnl-1 bat-ptl-1 bat-ptl-vm bat-ptl-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8635 -> IGTPW_14086
  * Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -> xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872

  IGTPW_14086: d8378366e6c8a7169c66d49dabc14bdfd125e960 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8635: 8635
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14086/index.html

--===============4956562683717206260==
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
<tr><td><b>Series:</b></td><td>Update sharpness filter test and related CI changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157833/">https://patchwork.freedesktop.org/series/157833/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14086/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14086/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8635_BAT -&gt; XEIGTPW_14086_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14086_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14086_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_14086_BAT prevented too many machines from booting.</p>
<p>Missing    (12): bat-bmg-1 bat-pvc-2 bat-lnl-2 bat-lnl-1 bat-ptl-1 bat-ptl-vm bat-ptl-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8635 -&gt; IGTPW_14086</li>
<li>Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -&gt; xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872</li>
</ul>
<p>IGTPW_14086: d8378366e6c8a7169c66d49dabc14bdfd125e960 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8635: 8635<br />
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8<br />
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872</p>

</body>
</html>

--===============4956562683717206260==--
