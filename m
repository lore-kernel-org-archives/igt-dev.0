Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C42FFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 00:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8F10E05C;
	Tue,  5 May 2026 00:35:04 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A70E10E05C;
 Tue,  5 May 2026 00:34:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0831574909139396131=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fexec=5Fsystem=5Falloca?=
 =?utf-8?q?tor=3A_fix_PREFETCH=5FSPLIT=5FVMA_bo=5Fsize_for_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 May 2026 00:34:48 -0000
Message-ID: <177794128842.37456.7583189419705150903@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504223717.1080309-1-jia.yao@intel.com>
In-Reply-To: <20260504223717.1080309-1-jia.yao@intel.com>
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

--===============0831574909139396131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC
URL   : https://patchwork.freedesktop.org/series/165937/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8883_BAT -> XEIGTPW_15097_BAT
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

  * IGT: IGT_8883 -> IGTPW_15097
  * Linux: xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5 -> xe-4982-9160312bed536c4b78ad3736fc1aaf25ed78bccd

  IGTPW_15097: a9c1e8c2eb4b291cd637a45162bc23316367a4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5
  xe-4982-9160312bed536c4b78ad3736fc1aaf25ed78bccd: 9160312bed536c4b78ad3736fc1aaf25ed78bccd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15097/index.html

--===============0831574909139396131==
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
<tr><td><b>Series:</b></td><td>xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165937/">https://patchwork.freedesktop.org/series/165937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15097/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15097/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8883_BAT -&gt; XEIGTPW_15097_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8883 -&gt; IGTPW_15097</li>
<li>Linux: xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5 -&gt; xe-4982-9160312bed536c4b78ad3736fc1aaf25ed78bccd</li>
</ul>
<p>IGTPW_15097: a9c1e8c2eb4b291cd637a45162bc23316367a4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8883: 8214859d2c4ecf8f81a08a3d2cd26f0a50d2b513 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4978-bbd6f35a43ab45240a445b713c5a18638ad5a0d5: bbd6f35a43ab45240a445b713c5a18638ad5a0d5<br />
  xe-4982-9160312bed536c4b78ad3736fc1aaf25ed78bccd: 9160312bed536c4b78ad3736fc1aaf25ed78bccd</p>

</body>
</html>

--===============0831574909139396131==--
