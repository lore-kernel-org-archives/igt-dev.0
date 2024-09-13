Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D0FA372B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 08:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8410ECC9;
	Fri, 13 Sep 2024 08:49:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E652910ECC8;
 Fri, 13 Sep 2024 08:49:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7897904040678524426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fvrr=3A_Update_LOBF?=
 =?utf-8?q?_test_to_resuse_the_existing_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Sep 2024 08:49:25 -0000
Message-ID: <172621736593.995611.15398475100391767048@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913065616.326959-1-jeevan.b@intel.com>
In-Reply-To: <20240913065616.326959-1-jeevan.b@intel.com>
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

--===============7897904040678524426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Update LOBF test to resuse the existing logic
URL   : https://patchwork.freedesktop.org/series/138625/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8015_BAT -> XEIGTPW_11739_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11739_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11739_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11739_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8015 -> IGTPW_11739
  * Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -> xe-1941-b4f339c3c8765a19cbd59c6cbe42efb0229d327b

  IGTPW_11739: 52ed40fc8a24cbac0d9afa6279b531f928d0d78a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8015: 8015
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8
  xe-1941-b4f339c3c8765a19cbd59c6cbe42efb0229d327b: b4f339c3c8765a19cbd59c6cbe42efb0229d327b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11739/index.html

--===============7897904040678524426==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Update LOBF test to resuse the existing logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138625/">https://patchwork.freedesktop.org/series/138625/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11739/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11739/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8015_BAT -&gt; XEIGTPW_11739_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11739_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11739_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11739_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8015 -&gt; IGTPW_11739</li>
<li>Linux: xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8 -&gt; xe-1941-b4f339c3c8765a19cbd59c6cbe42efb0229d327b</li>
</ul>
<p>IGTPW_11739: 52ed40fc8a24cbac0d9afa6279b531f928d0d78a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8015: 8015<br />
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8<br />
  xe-1941-b4f339c3c8765a19cbd59c6cbe42efb0229d327b: b4f339c3c8765a19cbd59c6cbe42efb0229d327b</p>

</body>
</html>

--===============7897904040678524426==--
