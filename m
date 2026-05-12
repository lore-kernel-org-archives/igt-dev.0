Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5E8CD4F24
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 17:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570F10EB9D;
	Tue, 12 May 2026 17:14:09 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF65D10E59A;
 Tue, 12 May 2026 17:13:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7975312569881462231=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Test_madvise=28MADV=5FDONTNEED=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 17:13:51 -0000
Message-ID: <177860603177.63850.5267737083253071719@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512081709.217905-1-francois.dugast@intel.com>
In-Reply-To: <20260512081709.217905-1-francois.dugast@intel.com>
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

--===============7975312569881462231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Test madvise(MADV_DONTNEED) (rev2)
URL   : https://patchwork.freedesktop.org/series/165410/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8905_BAT -> XEIGTPW_15162_BAT
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

  * IGT: IGT_8905 -> IGTPW_15162
  * Linux: xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4 -> xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472

  IGTPW_15162: 5c39f68f58753555edf82feaf043b035e3b99277 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4: b83102e9c06357b09f2cfbe944269786cb6985c4
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15162/index.html

--===============7975312569881462231==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Test madvise(MADV_DONTNEED) (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165410/">https://patchwork.freedesktop.org/series/165410/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15162/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15162/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8905_BAT -&gt; XEIGTPW_15162_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8905 -&gt; IGTPW_15162</li>
<li>Linux: xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4 -&gt; xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472</li>
</ul>
<p>IGTPW_15162: 5c39f68f58753555edf82feaf043b035e3b99277 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5047-b83102e9c06357b09f2cfbe944269786cb6985c4: b83102e9c06357b09f2cfbe944269786cb6985c4<br />
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472</p>

</body>
</html>

--===============7975312569881462231==--
