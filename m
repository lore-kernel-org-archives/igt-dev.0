Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE24DC0218D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 08:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CD510E149;
	Fri, 31 Jan 2025 08:27:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4843010E149;
 Fri, 31 Jan 2025 08:27:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2963702550833447849=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Inject_errors_during_exec_queue_create_IOCTL_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "pravalika gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jan 2025 08:27:49 -0000
Message-ID: <173831206928.3131849.10939428420556115569@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130094514.3282423-1-pravalika.gurram@intel.com>
In-Reply-To: <20250130094514.3282423-1-pravalika.gurram@intel.com>
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

--===============2963702550833447849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors during exec queue create IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/144138/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8218_BAT -> XEIGTPW_12526_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12526_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12526_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 3)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_12526_BAT prevented too many machines from booting.

  Missing    (5): bat-bmg-1 bat-adlp-vf bat-lnl-1 bat-atsm-2 bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8218 -> IGTPW_12526
  * Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -> xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e

  IGTPW_12526: 8f1ac3af9e07cd37376e133ea4a3886d4f4830f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b
  xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e: 0c2a60e7f1e779d87754254d9e3443beedbb684e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12526/index.html

--===============2963702550833447849==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject errors during exec queue create IOCTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144138/">https://patchwork.freedesktop.org/series/144138/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12526/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12526/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8218_BAT -&gt; XEIGTPW_12526_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12526_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12526_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 3)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_12526_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-bmg-1 bat-adlp-vf bat-lnl-1 bat-atsm-2 bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8218 -&gt; IGTPW_12526</li>
<li>Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -&gt; xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e</li>
</ul>
<p>IGTPW_12526: 8f1ac3af9e07cd37376e133ea4a3886d4f4830f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b<br />
  xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e: 0c2a60e7f1e779d87754254d9e3443beedbb684e</p>

</body>
</html>

--===============2963702550833447849==--
