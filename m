Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD5C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 20:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760110E1A5;
	Wed,  4 Jun 2025 20:49:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B21310E1FD;
 Wed,  4 Jun 2025 20:49:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5197836179168973907=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdrm=5Ffdin?=
 =?utf-8?q?fo=3A_Fix_TEST=5FWHILE=5FACTIVE_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Jun 2025 20:49:39 -0000
Message-ID: <174907017943.49780.1216586645703657485@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
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

--===============5197836179168973907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
URL   : https://patchwork.freedesktop.org/series/149848/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8396_BAT -> XEIGTPW_13245_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8396 -> IGTPW_13245

  IGTPW_13245: 16a2c6edacf75713eaa03cf93bab99ecbe033d0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8396: 8396
  xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b: 573b98ac3ff9ff95c3316789e97980277e4ffe2b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13245/index.html

--===============5197836179168973907==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149848/">https://patchwork.freedesktop.org/series/149848/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13245/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8396_BAT -&gt; XEIGTPW_13245_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8396 -&gt; IGTPW_13245</li>
</ul>
<p>IGTPW_13245: 16a2c6edacf75713eaa03cf93bab99ecbe033d0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8396: 8396<br />
  xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b: 573b98ac3ff9ff95c3316789e97980277e4ffe2b</p>

</body>
</html>

--===============5197836179168973907==--
