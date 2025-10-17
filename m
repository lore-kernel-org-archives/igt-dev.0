Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02368CCD183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 03:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0E10EAE5;
	Fri, 17 Oct 2025 03:01:47 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F0C10E133;
 Fri, 17 Oct 2025 03:01:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4095580771481220555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_drm=5Fopen=5Fdriver=28?=
 =?utf-8?q?=29_with_IGT=5FFORCE=5FDRIVER_and_DRIVER=5FANY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Oct 2025 03:01:46 -0000
Message-ID: <176067010601.24656.11228798738980309684@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
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

--===============4095580771481220555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY
URL   : https://patchwork.freedesktop.org/series/156071/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8589_BAT -> XEIGTPW_13915_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8589 -> IGTPW_13915
  * Linux: xe-3937-4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57 -> xe-3938-b4f191dddaee9ae1871344e3dabcc40f2f14d2cb

  IGTPW_13915: ea0a57dd83836099686117a9e6f1105ab5cdceef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8589: 8589
  xe-3937-4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57: 4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57
  xe-3938-b4f191dddaee9ae1871344e3dabcc40f2f14d2cb: b4f191dddaee9ae1871344e3dabcc40f2f14d2cb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13915/index.html

--===============4095580771481220555==
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
<tr><td><b>Series:</b></td><td>Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156071/">https://patchwork.freedesktop.org/series/156071/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13915/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13915/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8589_BAT -&gt; XEIGTPW_13915_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8589 -&gt; IGTPW_13915</li>
<li>Linux: xe-3937-4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57 -&gt; xe-3938-b4f191dddaee9ae1871344e3dabcc40f2f14d2cb</li>
</ul>
<p>IGTPW_13915: ea0a57dd83836099686117a9e6f1105ab5cdceef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8589: 8589<br />
  xe-3937-4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57: 4d42fb4c5d6e5b335f7e5356cf8b615da4e20d57<br />
  xe-3938-b4f191dddaee9ae1871344e3dabcc40f2f14d2cb: b4f191dddaee9ae1871344e3dabcc40f2f14d2cb</p>

</body>
</html>

--===============4095580771481220555==--
