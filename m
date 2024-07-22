Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFE3C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 20:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940310E2E8;
	Mon, 22 Jul 2024 20:49:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284E10E2EF;
 Mon, 22 Jul 2024 20:49:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0603893129784303356=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe/oa=3A_Handle_SIMD16=5FE?=
 =?utf-8?q?U=5FPER=5FDSS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Jul 2024 20:49:57 -0000
Message-ID: <172168139753.354009.3616834816769852802@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722190717.57192-1-lucas.demarchi@intel.com>
In-Reply-To: <20240722190717.57192-1-lucas.demarchi@intel.com>
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

--===============0603893129784303356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/oa: Handle SIMD16_EU_PER_DSS
URL   : https://patchwork.freedesktop.org/series/136355/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7934_BAT -> XEIGTPW_11443_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11443_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169] / [Intel XE#1356])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7934/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11443/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356


Build changes
-------------

  * IGT: IGT_7934 -> IGTPW_11443

  IGTPW_11443: da9b6a0da5d2a2ac59b79aa85af88fceed09d009 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7934: 7934
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11443/index.html

--===============0603893129784303356==
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
<tr><td><b>Series:</b></td><td>lib/xe/oa: Handle SIMD16_EU_PER_DSS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136355/">https://patchwork.freedesktop.org/series/136355/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11443/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11443/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7934_BAT -&gt; XEIGTPW_11443_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11443_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7934/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11443/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7934 -&gt; IGTPW_11443</li>
</ul>
<p>IGTPW_11443: da9b6a0da5d2a2ac59b79aa85af88fceed09d009 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7934: 7934<br />
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0</p>

</body>
</html>

--===============0603893129784303356==--
