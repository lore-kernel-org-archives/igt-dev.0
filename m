Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34AC3ABCB
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 00:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C15710E273;
	Tue, 13 May 2025 00:24:56 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7492410E273;
 Tue, 13 May 2025 00:24:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8925915309055893621=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fmmap=3A_Sk?=
 =?utf-8?q?ip_pci-membarrier-parallel_test_on_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kolanupaka Naveena" <kolanupaka.naveena@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 May 2025 00:24:54 -0000
Message-ID: <174709589445.71961.1408134218322306642@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512073625.2648634-1-kolanupaka.naveena@intel.com>
In-Reply-To: <20250512073625.2648634-1-kolanupaka.naveena@intel.com>
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

--===============8925915309055893621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_mmap: Skip pci-membarrier-parallel test on PVC
URL   : https://patchwork.freedesktop.org/series/148860/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8362_BAT -> XEIGTPW_13111_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8362 -> IGTPW_13111

  IGTPW_13111: 13111
  IGT_8362: 8362
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13111/index.html

--===============8925915309055893621==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_mmap: Skip pci-membarrier-parallel test on PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148860/">https://patchwork.freedesktop.org/series/148860/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13111/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13111/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8362_BAT -&gt; XEIGTPW_13111_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGTPW_13111</li>
</ul>
<p>IGTPW_13111: 13111<br />
  IGT_8362: 8362<br />
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c</p>

</body>
</html>

--===============8925915309055893621==--
