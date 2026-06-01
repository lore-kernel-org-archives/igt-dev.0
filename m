Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB2ECD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 06:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4DC112DF1;
	Mon,  1 Jun 2026 06:02:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF35112DF1;
 Mon,  1 Jun 2026 06:01:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2476038697898168109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fpipe=5Fcrc=5Fba?=
 =?utf-8?q?sic=3A_add_mst_suspend-resume_test_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Jun 2026 06:01:42 -0000
Message-ID: <178029370217.28824.17384439981063325200@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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

--===============2476038697898168109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_crc_basic: add mst suspend-resume test (rev7)
URL   : https://patchwork.freedesktop.org/series/158091/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8943_BAT -> XEIGTPW_15275_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15275_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15275_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_15275_BAT prevented too many machines from booting.

  Missing    (12): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8943 -> IGTPW_15275
  * Linux: xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579 -> xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119

  IGTPW_15275: 15275
  IGT_8943: 8943
  xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579: 158de01c718ed9dd7cb123d0df59a6077be26579
  xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119: f4ba932abb4422a63c72a272b0386f745ce9a119

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15275/index.html

--===============2476038697898168109==
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
<tr><td><b>Series:</b></td><td>tests/kms_pipe_crc_basic: add mst suspend-resume test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158091/">https://patchwork.freedesktop.org/series/158091/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15275/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15275/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8943_BAT -&gt; XEIGTPW_15275_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15275_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15275_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_15275_BAT prevented too many machines from booting.</p>
<p>Missing    (12): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8943 -&gt; IGTPW_15275</li>
<li>Linux: xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579 -&gt; xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119</li>
</ul>
<p>IGTPW_15275: 15275<br />
  IGT_8943: 8943<br />
  xe-5155-158de01c718ed9dd7cb123d0df59a6077be26579: 158de01c718ed9dd7cb123d0df59a6077be26579<br />
  xe-5168-f4ba932abb4422a63c72a272b0386f745ce9a119: f4ba932abb4422a63c72a272b0386f745ce9a119</p>

</body>
</html>

--===============2476038697898168109==--
