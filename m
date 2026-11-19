Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5B606A324
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 11:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089AA1122FC;
	Thu, 19 Nov 2026 11:56:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E451122FC;
 Thu, 19 Nov 2026 11:54:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4248151889908204844=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fhangman?=
 =?utf-8?q?=3A_Add_engine-error-state-skipped-capture_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Nov 2026 11:54:56 -0000
Message-ID: <179508929699.51026.12962243214985207227@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4248151889908204844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Add engine-error-state-skipped-capture (rev2)
URL   : https://patchwork.freedesktop.org/series/178889/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9198_BAT -> XEIGTPW_16181_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9198 -> IGTPW_16181
  * Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -> xe-6186-84508686117ca3be5756049acdf15e3e47fd2683

  IGTPW_16181: 267c5871fc69854bd8a1808993f5e6c18c3ef1b9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9198: 9198
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef
  xe-6186-84508686117ca3be5756049acdf15e3e47fd2683: 84508686117ca3be5756049acdf15e3e47fd2683

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16181/index.html

--===============4248151889908204844==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_hangman: Add engine-error-state-skipped-capture (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178889/">https://patchwork.freedesktop.org/series/178889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16181/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16181/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9198_BAT -&gt; XEIGTPW_16181_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9198 -&gt; IGTPW_16181</li>
<li>Linux: xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef -&gt; xe-6186-84508686117ca3be5756049acdf15e3e47fd2683</li>
</ul>
<p>IGTPW_16181: 267c5871fc69854bd8a1808993f5e6c18c3ef1b9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9198: 9198<br />
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef<br />
  xe-6186-84508686117ca3be5756049acdf15e3e47fd2683: 84508686117ca3be5756049acdf15e3e47fd2683</p>

</body>
</html>

--===============4248151889908204844==--
