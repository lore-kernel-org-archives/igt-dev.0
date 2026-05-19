Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17C1CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 01:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495BD10E073;
	Tue, 19 May 2026 01:39:51 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E863910E073;
 Tue, 19 May 2026 01:39:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3402839923429958704=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/core=5Fhotunplug=3A_a?=
 =?utf-8?q?dd_*-with-load_subtests_exercising_GPU_workload_during_hotplug_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 01:39:32 -0000
Message-ID: <177915477294.83379.4768743086813022561@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260518154808.118134-2-nitin.r.gote@intel.com>
In-Reply-To: <20260518154808.118134-2-nitin.r.gote@intel.com>
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

--===============3402839923429958704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug (rev3)
URL   : https://patchwork.freedesktop.org/series/166744/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8918_BAT -> XEIGTPW_15199_BAT
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

  * IGT: IGT_8918 -> IGTPW_15199
  * Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -> xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356

  IGTPW_15199: dafa11285833f8ef069ee001df251685804c67e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8918: 8918
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15199/index.html

--===============3402839923429958704==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166744/">https://patchwork.freedesktop.org/series/166744/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15199/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15199/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8918_BAT -&gt; XEIGTPW_15199_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8918 -&gt; IGTPW_15199</li>
<li>Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -&gt; xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356</li>
</ul>
<p>IGTPW_15199: dafa11285833f8ef069ee001df251685804c67e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8918: 8918<br />
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900<br />
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356</p>

</body>
</html>

--===============3402839923429958704==--
