Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B069DCAC5AC
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 23:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABEC10E00E;
	Mon, 22 Sep 2025 23:21:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A63910E00E;
 Mon, 22 Sep 2025 23:21:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8864204400306359262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tools/intel=5Fdisplay=5Fpo?=
 =?utf-8?q?ller=3A_Various_things?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Sep 2025 23:21:56 -0000
Message-ID: <175858331608.355749.9760377805164496769@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
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

--===============8864204400306359262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_display_poller: Various things
URL   : https://patchwork.freedesktop.org/series/154853/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8547_FULL -> XEIGTPW_13796_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8547 -> IGTPW_13796
  * Linux: xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0 -> xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1

  IGTPW_13796: bdc7bb7c338b0c00eed2d5258e2e997533da9813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8547: 8547
  xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0: c4d19320a0e2f7d8dec97d4a59309349a3a63ec0
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13796/index.html

--===============8864204400306359262==
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
<tr><td><b>Series:</b></td><td>tools/intel_display_poller: Various things</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154853/">https://patchwork.freedesktop.org/series/154853/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13796/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13796/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8547_FULL -&gt; XEIGTPW_13796_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8547 -&gt; IGTPW_13796</li>
<li>Linux: xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0 -&gt; xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1</li>
</ul>
<p>IGTPW_13796: bdc7bb7c338b0c00eed2d5258e2e997533da9813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8547: 8547<br />
  xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0: c4d19320a0e2f7d8dec97d4a59309349a3a63ec0<br />
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1</p>

</body>
</html>

--===============8864204400306359262==--
