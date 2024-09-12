Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12513EE6456
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 07:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28A10E78F;
	Thu, 12 Sep 2024 07:15:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3443010E1F2;
 Thu, 12 Sep 2024 07:15:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0186469154750171973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/kms=5Fpsr=3A_DP2?=
 =?utf-8?q?=2E1_PR_IGT_Fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 07:15:11 -0000
Message-ID: <172612531118.990034.11925739321139671270@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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

--===============0186469154750171973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/138157/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8013_BAT -> XEIGTPW_11726_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11726_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11726_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11726_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8013 -> IGTPW_11726
  * Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -> xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a

  IGTPW_11726: df40b982dab2612af31468227979f3eb5d6ca8e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8013: 8013
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8
  xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a: 1b37d4587b45639327eeb4cce29f77d487f7700a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11726/index.html

--===============0186469154750171973==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138157/">https://patchwork.freedesktop.org/series/138157/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11726/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11726/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8013_BAT -&gt; XEIGTPW_11726_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11726_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11726_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11726_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8013 -&gt; IGTPW_11726</li>
<li>Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -&gt; xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a</li>
</ul>
<p>IGTPW_11726: df40b982dab2612af31468227979f3eb5d6ca8e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8013: 8013<br />
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8<br />
  xe-1932-1b37d4587b45639327eeb4cce29f77d487f7700a: 1b37d4587b45639327eeb4cce29f77d487f7700a</p>

</body>
</html>

--===============0186469154750171973==--
