Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E3C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 17:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D87110E4EE;
	Tue,  7 Jul 2026 17:35:48 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA8210E4EE;
 Tue,  7 Jul 2026 17:35:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0189710123336959523=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fhdr=3A_Enable_D?=
 =?utf-8?q?RM_KMS_debug_mask_for_invalid-hdr_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 17:35:19 -0000
Message-ID: <178344571925.162671.9362867526300483754@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707121528.2984729-1-swati2.sharma@intel.com>
In-Reply-To: <20260707121528.2984729-1-swati2.sharma@intel.com>
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

--===============0189710123336959523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_hdr: Enable DRM KMS debug mask for invalid-hdr subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/168130/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8991_BAT -> XEIGTPW_15481_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8991 -> IGTPW_15481
  * Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -> xe-5358-7a8782fa5da551a92ada0aca6f7dbadfc4c36da3

  IGTPW_15481: 0f17a82da1f85c1f7e7bc82aab34f7dfcc0b9463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907
  xe-5358-7a8782fa5da551a92ada0aca6f7dbadfc4c36da3: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15481/index.html

--===============0189710123336959523==
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
<tr><td><b>Series:</b></td><td>tests/kms_hdr: Enable DRM KMS debug mask for invalid-hdr subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168130/">https://patchwork.freedesktop.org/series/168130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15481/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15481/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8991_BAT -&gt; XEIGTPW_15481_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8991 -&gt; IGTPW_15481</li>
<li>Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -&gt; xe-5358-7a8782fa5da551a92ada0aca6f7dbadfc4c36da3</li>
</ul>
<p>IGTPW_15481: 0f17a82da1f85c1f7e7bc82aab34f7dfcc0b9463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907<br />
  xe-5358-7a8782fa5da551a92ada0aca6f7dbadfc4c36da3: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3</p>

</body>
</html>

--===============0189710123336959523==--
