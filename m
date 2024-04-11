Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F93CD1297
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 00:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EAA10EB3F;
	Thu, 11 Apr 2024 00:26:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A93810EB3F;
 Thu, 11 Apr 2024 00:26:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1849469356447582367=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_drm-uapi/xe=3A_Add_device_atomics_vm_bind_flags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Apr 2024 00:26:36 -0000
Message-ID: <171279519649.1338936.15604895061782902673@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410170041.24963-1-nirmoy.das@intel.com>
In-Reply-To: <20240410170041.24963-1-nirmoy.das@intel.com>
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

--===============1849469356447582367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] drm-uapi/xe: Add device atomics vm bind flags
URL   : https://patchwork.freedesktop.org/series/132289/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7805_BAT -> XEIGTPW_11002_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11002_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11002_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11002_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7805 -> IGTPW_11002

  IGTPW_11002: 11002
  IGT_7805: 7805
  xe-1073-72c79c9b20ced92d5c10230bb50fca29c9f387f9: 72c79c9b20ced92d5c10230bb50fca29c9f387f9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11002/index.html

--===============1849469356447582367==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] drm-uapi/xe: Add device atomics vm bind flags</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132289/">https://patchwork.freedesktop.org/series/132289/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11002/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11002/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7805_BAT -&gt; XEIGTPW_11002_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11002_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11002_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11002_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7805 -&gt; IGTPW_11002</li>
</ul>
<p>IGTPW_11002: 11002<br />
  IGT_7805: 7805<br />
  xe-1073-72c79c9b20ced92d5c10230bb50fca29c9f387f9: 72c79c9b20ced92d5c10230bb50fca29c9f387f9</p>

</body>
</html>

--===============1849469356447582367==--
