Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABD7C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 08:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067610E7AD;
	Thu, 23 Jan 2025 08:44:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C6D10E79C;
 Thu, 23 Jan 2025 08:44:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8426827211452005511=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcompute=3A?=
 =?utf-8?q?_Add_test_documentation_to_reflect_proper_category?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:44:26 -0000
Message-ID: <173762186615.3460470.3895680915593244580@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123051831.19096-1-aditya.chauhan@intel.com>
In-Reply-To: <20250123051831.19096-1-aditya.chauhan@intel.com>
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

--===============8426827211452005511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute: Add test documentation to reflect proper category
URL   : https://patchwork.freedesktop.org/series/143873/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8207_BAT -> XEIGTPW_12482_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 4)
------------------------------

  Missing    (4): bat-bmg-2 bat-adlp-vf bat-lnl-1 bat-atsm-2 

Known issues
------------

  Here are the changes found in XEIGTPW_12482_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][1] ([i915#5274]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12482/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8207 -> IGTPW_12482
  * Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -> xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4

  IGTPW_12482: f3624b8be8c291e0828028509e9225aae4d7b69a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf834fed3dc490343d2
  xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4: 33906a7032dfca356fd7309e6abbdf5a7ea97db4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12482/index.html

--===============8426827211452005511==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute: Add test documentation to reflect proper category</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143873/">https://patchwork.freedesktop.org/series/143873/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12482/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12482/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8207_BAT -&gt; XEIGTPW_12482_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 4)</h2>
<p>Missing    (4): bat-bmg-2 bat-adlp-vf bat-lnl-1 bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12482_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12482/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8207 -&gt; IGTPW_12482</li>
<li>Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -&gt; xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4</li>
</ul>
<p>IGTPW_12482: f3624b8be8c291e0828028509e9225aae4d7b69a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf834fed3dc490343d2<br />
  xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4: 33906a7032dfca356fd7309e6abbdf5a7ea97db4</p>

</body>
</html>

--===============8426827211452005511==--
