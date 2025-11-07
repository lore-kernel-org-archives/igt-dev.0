Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D74CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 01:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6FF10EA20;
	Fri,  7 Nov 2025 01:50:31 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3410EA1E;
 Fri,  7 Nov 2025 01:50:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7616860033979903755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_Tie?=
 =?utf-8?q?_preempt_timeout_to_exec_quantum_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Nov 2025 01:50:30 -0000
Message-ID: <176248023074.28415.16825541700776906496@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106232120.277273-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251106232120.277273-2-jonathan.cavitt@intel.com>
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

--===============7616860033979903755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Tie preempt timeout to exec quantum (rev2)
URL   : https://patchwork.freedesktop.org/series/157194/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8613_BAT -> XEIGTPW_14020_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8613 -> IGTPW_14020
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-4061-751da7bf02f20d19685d88c1dc9e52010cdbb03c

  IGTPW_14020: 3ba1d29f5dcc9f1e2e86b6365f3bb7154ed9c466 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-4061-751da7bf02f20d19685d88c1dc9e52010cdbb03c: 751da7bf02f20d19685d88c1dc9e52010cdbb03c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14020/index.html

--===============7616860033979903755==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Tie preempt timeout to exec quantum (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157194/">https://patchwork.freedesktop.org/series/157194/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14020/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14020/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8613_BAT -&gt; XEIGTPW_14020_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGTPW_14020</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-4061-751da7bf02f20d19685d88c1dc9e52010cdbb03c</li>
</ul>
<p>IGTPW_14020: 3ba1d29f5dcc9f1e2e86b6365f3bb7154ed9c466 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-4061-751da7bf02f20d19685d88c1dc9e52010cdbb03c: 751da7bf02f20d19685d88c1dc9e52010cdbb03c</p>

</body>
</html>

--===============7616860033979903755==--
