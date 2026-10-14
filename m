Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C10CC6B24
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 05:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF7410F78C;
	Wed, 14 Oct 2026 05:36:28 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3C710FACB;
 Wed, 14 Oct 2026 05:35:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0469257167568622000=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Xe3P_GPU_Error_Injection_Te?=
 =?utf-8?q?st_Suite_with_DRM_RAS_Netlink_Support_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2026 05:35:40 -0000
Message-ID: <179195614043.21978.9976869744190389903@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

--===============0469257167568622000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev8)
URL   : https://patchwork.freedesktop.org/series/171275/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9144_BAT -> XEIGTPW_15982_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_15982_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9144/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15982/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9144 -> IGTPW_15982
  * Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -> xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6

  IGTPW_15982: fe2d65278bcb1f5f4644a671204c80f66023437b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426727905f9fcd75836d
  xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15982/index.html

--===============0469257167568622000==
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
<tr><td><b>Series:</b></td><td>Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171275/">https://patchwork.freedesktop.org/series/171275/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15982/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15982/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9144_BAT -&gt; XEIGTPW_15982_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15982_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9144/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15982/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9144 -&gt; IGTPW_15982</li>
<li>Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -&gt; xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6</li>
</ul>
<p>IGTPW_15982: fe2d65278bcb1f5f4644a671204c80f66023437b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426727905f9fcd75836d<br />
  xe-5943-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6</p>

</body>
</html>

--===============0469257167568622000==--
