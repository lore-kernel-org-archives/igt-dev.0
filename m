Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15FCFB44A9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 05:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C6710F25D;
	Fri, 24 Apr 2026 05:39:41 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC3F10F281;
 Fri, 24 Apr 2026 05:39:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2346158146599731887=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=3A_Ad?=
 =?utf-8?q?d_VM_rebind_stress_test_with_cpumask_cycling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Apr 2026 05:39:27 -0000
Message-ID: <177700916764.6382.5328047134823289595@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424042457.2178562-1-s.sebinraj@intel.com>
In-Reply-To: <20260424042457.2178562-1-s.sebinraj@intel.com>
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

--===============2346158146599731887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec: Add VM rebind stress test with cpumask cycling
URL   : https://patchwork.freedesktop.org/series/165395/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8872_BAT -> XEIGTPW_15049_BAT
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

  * IGT: IGT_8872 -> IGTPW_15049
  * Linux: xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c -> xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4

  IGTPW_15049: be64d028e3c87b4380f9135f8207ba17a055f531 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c: ecb61ba4a1f619b6944f4d0741b4d8a0910f460c
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/index.html

--===============2346158146599731887==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec: Add VM rebind stress test with cpumask cycling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165395/">https://patchwork.freedesktop.org/series/165395/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15049/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8872_BAT -&gt; XEIGTPW_15049_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8872 -&gt; IGTPW_15049</li>
<li>Linux: xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c -&gt; xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4</li>
</ul>
<p>IGTPW_15049: be64d028e3c87b4380f9135f8207ba17a055f531 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4929-ecb61ba4a1f619b6944f4d0741b4d8a0910f460c: ecb61ba4a1f619b6944f4d0741b4d8a0910f460c<br />
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4</p>

</body>
</html>

--===============2346158146599731887==--
