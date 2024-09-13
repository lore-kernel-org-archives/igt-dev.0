Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E61FA375A
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 14:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507C10E27B;
	Fri, 13 Sep 2024 14:49:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1F210E274;
 Fri, 13 Sep 2024 14:49:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5900133894547910940=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Switch_the_FFT_library_to_meow?=
 =?utf-8?q?=5Ffft?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Sep 2024 14:49:04 -0000
Message-ID: <172623894417.996907.16199472099825926752@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
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

--===============5900133894547910940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Switch the FFT library to meow_fft
URL   : https://patchwork.freedesktop.org/series/138642/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8016_BAT -> XEIGTPW_11742_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11742_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11742_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11742_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8016 -> IGTPW_11742

  IGTPW_11742: 57d5e1175de54513890bf9465f99844405b367bb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1945-ceffbbae8df33f194ae06e0174dfb0a7d726b2f7: ceffbbae8df33f194ae06e0174dfb0a7d726b2f7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11742/index.html

--===============5900133894547910940==
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
<tr><td><b>Series:</b></td><td>Switch the FFT library to meow_fft</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138642/">https://patchwork.freedesktop.org/series/138642/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11742/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11742/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8016_BAT -&gt; XEIGTPW_11742_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11742_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11742_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11742_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8016 -&gt; IGTPW_11742</li>
</ul>
<p>IGTPW_11742: 57d5e1175de54513890bf9465f99844405b367bb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1945-ceffbbae8df33f194ae06e0174dfb0a7d726b2f7: ceffbbae8df33f194ae06e0174dfb0a7d726b2f7</p>

</body>
</html>

--===============5900133894547910940==--
