Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433ACCD192
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 08:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44B10E24F;
	Wed, 18 Sep 2024 08:50:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42B110E24F;
 Wed, 18 Sep 2024 08:50:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6905020323006919012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_tests_for_ultrajoiner_vali?=
 =?utf-8?q?dation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Sep 2024 08:50:56 -0000
Message-ID: <172664945685.1025052.12985221191939601737@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918073413.28598-1-karthik.b.s@intel.com>
In-Reply-To: <20240918073413.28598-1-karthik.b.s@intel.com>
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

--===============6905020323006919012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests for ultrajoiner validation (rev3)
URL   : https://patchwork.freedesktop.org/series/137133/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8023_BAT -> XEIGTPW_11752_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11752_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11752_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11752_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8023 -> IGTPW_11752
  * Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 -> xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e

  IGTPW_11752: ecc6bec9289038a076161ce788856aa2445778f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3: 38e1b615fb395b928e514108e908cd6edf3d34c3
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11752/index.html

--===============6905020323006919012==
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
<tr><td><b>Series:</b></td><td>Add tests for ultrajoiner validation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137133/">https://patchwork.freedesktop.org/series/137133/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11752/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11752/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8023_BAT -&gt; XEIGTPW_11752_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11752_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11752_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11752_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8023 -&gt; IGTPW_11752</li>
<li>Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 -&gt; xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e</li>
</ul>
<p>IGTPW_11752: ecc6bec9289038a076161ce788856aa2445778f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3: 38e1b615fb395b928e514108e908cd6edf3d34c3<br />
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e</p>

</body>
</html>

--===============6905020323006919012==--
