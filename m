Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1126FF459E4
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 14:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E9A10E969;
	Fri, 10 Apr 2026 14:46:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179C10E969;
 Fri, 10 Apr 2026 14:46:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6282812777787692562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=3A_Add_purgeable_m?=
 =?utf-8?q?emory_madvise_tests_for_system_allocator_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Apr 2026 14:46:14 -0000
Message-ID: <177583237437.451529.5221821404897843798@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260410093525.2409612-1-arvind.yadav@intel.com>
In-Reply-To: <20260410093525.2409612-1-arvind.yadav@intel.com>
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

--===============6282812777787692562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add purgeable memory madvise tests for system allocator (rev9)
URL   : https://patchwork.freedesktop.org/series/160333/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8853_BAT -> XEIGTPW_14962_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14962_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8853 -> IGTPW_14962

  IGTPW_14962: 305e3b6a854ed0f9f2473ff5dcf4ff247d1b7af4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8853: b52b42b0c987404a8cbf80c77a41e37705e32779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db: 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html

--===============6282812777787692562==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add purgeable memory madvise tests for system allocator (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160333/">https://patchwork.freedesktop.org/series/160333/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8853_BAT -&gt; XEIGTPW_14962_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14962_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8853 -&gt; IGTPW_14962</li>
</ul>
<p>IGTPW_14962: 305e3b6a854ed0f9f2473ff5dcf4ff247d1b7af4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8853: b52b42b0c987404a8cbf80c77a41e37705e32779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db: 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db</p>

</body>
</html>

--===============6282812777787692562==--
