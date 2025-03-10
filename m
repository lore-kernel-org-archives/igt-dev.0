Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C24FC28B2E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 12:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45CF10E10C;
	Mon, 10 Mar 2025 12:38:38 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AC610E093;
 Mon, 10 Mar 2025 12:38:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2329149048961945651=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fhotplug?=
 =?utf-8?q?=3A_Check_the_suspend_state_after_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Mar 2025 12:38:37 -0000
Message-ID: <174161031766.13794.6959069119232200086@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310091440.2045-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250310091440.2045-1-chiahsuan.chung@amd.com>
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

--===============2329149048961945651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_hotplug: Check the suspend state after resume
URL   : https://patchwork.freedesktop.org/series/146067/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8267_BAT -> XEIGTPW_12736_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12736_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8267 -> IGTPW_12736

  IGTPW_12736: 3d53622493160177e5e6e98b5a64e00e376273c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/index.html

--===============2329149048961945651==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_hotplug: Check the suspend state after resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146067/">https://patchwork.freedesktop.org/series/146067/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8267_BAT -&gt; XEIGTPW_12736_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12736_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8267 -&gt; IGTPW_12736</li>
</ul>
<p>IGTPW_12736: 3d53622493160177e5e6e98b5a64e00e376273c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a</p>

</body>
</html>

--===============2329149048961945651==--
