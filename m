Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC409C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 04:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6652C10E436;
	Thu, 24 Apr 2025 04:45:24 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4910E436;
 Thu, 24 Apr 2025 04:45:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5592907668002526816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Ffault=5Finjectio?=
 =?utf-8?q?n=3A_Skip_OA_test_if_Xe_OA_interface_is_not_available?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Apr 2025 04:45:23 -0000
Message-ID: <174546992341.3790.10951948239865104001@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
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

--===============5592907668002526816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_fault_injection: Skip OA test if Xe OA interface is not available
URL   : https://patchwork.freedesktop.org/series/148132/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8333_BAT -> XEIGTPW_13032_BAT
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

  Here are the changes found in XEIGTPW_13032_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [DMESG-WARN][1] ([Intel XE#4829]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  [Intel XE#4829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829


Build changes
-------------

  * IGT: IGT_8333 -> IGTPW_13032
  * Linux: xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3 -> xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494

  IGTPW_13032: d76bf793e4c366bd44f0b974dd9e109ce2983621 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8333: 1d01b63833a43f8354882205125d1ed76080109e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3: ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3
  xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494: a8900c1b61e733563cb6dfa5173ff5cd8bb0e494

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/index.html

--===============5592907668002526816==
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
<tr><td><b>Series:</b></td><td>tests/xe_fault_injection: Skip OA test if Xe OA interface is not available</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148132/">https://patchwork.freedesktop.org/series/148132/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8333_BAT -&gt; XEIGTPW_13032_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13032_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8333 -&gt; IGTPW_13032</li>
<li>Linux: xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3 -&gt; xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494</li>
</ul>
<p>IGTPW_13032: d76bf793e4c366bd44f0b974dd9e109ce2983621 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8333: 1d01b63833a43f8354882205125d1ed76080109e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3: ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3<br />
  xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494: a8900c1b61e733563cb6dfa5173ff5cd8bb0e494</p>

</body>
</html>

--===============5592907668002526816==--
