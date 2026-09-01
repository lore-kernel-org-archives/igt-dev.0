Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64107C624D2
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 12:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0771210EACE;
	Tue,  1 Sep 2026 12:36:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C910ECB7;
 Tue,  1 Sep 2026 12:35:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3842566606300814625=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_fix_?=
 =?utf-8?q?double_munmap_of_first_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Sep 2026 12:35:46 -0000
Message-ID: <178826614610.106842.89012653750198758@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831162928.201586-1-nishit.sharma@intel.com>
In-Reply-To: <20260831162928.201586-1-nishit.sharma@intel.com>
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

--===============3842566606300814625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: fix double munmap of first mapping
URL   : https://patchwork.freedesktop.org/series/173081/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9078_BAT -> XEIGTPW_15758_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9078 -> IGTPW_15758
  * Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -> xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f

  IGTPW_15758: a04d3704177fd0c2abd67a35f9365c0ebac4cbf7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9078: 9078
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15758/index.html

--===============3842566606300814625==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: fix double munmap of first mapping</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173081/">https://patchwork.freedesktop.org/series/173081/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15758/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15758/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9078_BAT -&gt; XEIGTPW_15758_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9078 -&gt; IGTPW_15758</li>
<li>Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -&gt; xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f</li>
</ul>
<p>IGTPW_15758: a04d3704177fd0c2abd67a35f9365c0ebac4cbf7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9078: 9078<br />
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e<br />
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f</p>

</body>
</html>

--===============3842566606300814625==--
