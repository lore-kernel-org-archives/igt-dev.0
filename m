Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84324C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 07:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E193610E0F5;
	Tue, 11 Jun 2024 07:19:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8331610E0F5;
 Tue, 11 Jun 2024 07:19:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7657824175057789562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_IGT_KMS_Test_cleanup_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jun 2024 07:19:25 -0000
Message-ID: <171809036552.66418.18333696743606889124@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

--===============7657824175057789562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT KMS Test cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/134685/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7880_BAT -> XEIGTPW_11247_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11247_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11247_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11247_BAT prevented too many machines from booting.

  Missing    (3): bat-dg2-oem2 bat-lnl-1 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7880 -> IGTPW_11247
  * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59

  IGTPW_11247: 42e1813d438fd5a17ad3e3408d712eb7beab642b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
  xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59: 34997e6c7d5e203ee9b54b8da59270ead2a82c59

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11247/index.html

--===============7657824175057789562==
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
<tr><td><b>Series:</b></td><td>IGT KMS Test cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134685/">https://patchwork.freedesktop.org/series/134685/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11247/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7880_BAT -&gt; XEIGTPW_11247_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11247_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11247_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11247_BAT prevented too many machines from booting.</p>
<p>Missing    (3): bat-dg2-oem2 bat-lnl-1 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7880 -&gt; IGTPW_11247</li>
<li>Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -&gt; xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59</li>
</ul>
<p>IGTPW_11247: 42e1813d438fd5a17ad3e3408d712eb7beab642b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c<br />
  xe-1441-34997e6c7d5e203ee9b54b8da59270ead2a82c59: 34997e6c7d5e203ee9b54b8da59270ead2a82c59</p>

</body>
</html>

--===============7657824175057789562==--
