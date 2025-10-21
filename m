Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31513CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 04:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ABC10E2C0;
	Tue, 21 Oct 2025 04:30:35 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057810E2C0;
 Tue, 21 Oct 2025 04:30:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4244599002452552383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_drm=5Fopen=5Fdriver=28?=
 =?utf-8?q?=29_with_IGT=5FFORCE=5FDRIVER_and_DRIVER=5FANY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Oct 2025 04:30:34 -0000
Message-ID: <176102103464.35862.8733291193446625004@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
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

--===============4244599002452552383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY (rev2)
URL   : https://patchwork.freedesktop.org/series/156071/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8594_BAT -> XEIGTPW_13924_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8594 -> IGTPW_13924

  IGTPW_13924: 5d4d0739a7aa5b66b4e85c519014677c8f2a2e72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8594: 8594
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13924/index.html

--===============4244599002452552383==
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
<tr><td><b>Series:</b></td><td>Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156071/">https://patchwork.freedesktop.org/series/156071/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13924/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13924/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8594_BAT -&gt; XEIGTPW_13924_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8594 -&gt; IGTPW_13924</li>
</ul>
<p>IGTPW_13924: 5d4d0739a7aa5b66b4e85c519014677c8f2a2e72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8594: 8594<br />
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad</p>

</body>
</html>

--===============4244599002452552383==--
