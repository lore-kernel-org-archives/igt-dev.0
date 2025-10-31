Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76399CCF9F0
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 00:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671510EA8A;
	Fri, 31 Oct 2025 00:12:24 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2E10EA9B;
 Fri, 31 Oct 2025 00:12:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4378712806465194736=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_tests/intel/xe=5Fpmu=3A_Fix_frequency_assertion_when_RPe_rais?=
 =?utf-8?q?es_min_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Oct 2025 00:12:22 -0000
Message-ID: <176186954266.2568.4579704881502534715@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030192627.3810994-3-sk.anirban@intel.com>
In-Reply-To: <20251030192627.3810994-3-sk.anirban@intel.com>
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

--===============4378712806465194736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/intel/xe_pmu: Fix frequency assertion when RPe raises min frequency
URL   : https://patchwork.freedesktop.org/series/156782/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8603_BAT -> XEIGTPW_13968_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8603 -> IGTPW_13968
  * Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -> xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641

  IGTPW_13968: 49203b5f5a423b3acfbfd725e142c6da7ab0bcc8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63
  xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641: b50629a75c6ecb269adbba8de7b8ab4c9a650641

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13968/index.html

--===============4378712806465194736==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/intel/xe_pmu: Fix frequency assertion when RPe raises min frequency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156782/">https://patchwork.freedesktop.org/series/156782/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13968/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8603_BAT -&gt; XEIGTPW_13968_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8603 -&gt; IGTPW_13968</li>
<li>Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -&gt; xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641</li>
</ul>
<p>IGTPW_13968: 49203b5f5a423b3acfbfd725e142c6da7ab0bcc8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63<br />
  xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641: b50629a75c6ecb269adbba8de7b8ab4c9a650641</p>

</body>
</html>

--===============4378712806465194736==--
