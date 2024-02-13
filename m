Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55834C48260
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 17:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E8210E575;
	Tue, 13 Feb 2024 17:57:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B095710E550;
 Tue, 13 Feb 2024 17:57:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8756830943382241171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Fmultipipe?=
 =?utf-8?q?=5Fmodeset=3A_Run_modeset_and_display_enable_for_multidisplays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Feb 2024 17:57:46 -0000
Message-ID: <170784706672.1218563.10640930271319703761@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213165145.49514-1-hersenxs.wu@amd.com>
In-Reply-To: <20240213165145.49514-1-hersenxs.wu@amd.com>
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

--===============8756830943382241171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_multipipe_modeset: Run modeset and display enable for multidisplays
URL   : https://patchwork.freedesktop.org/series/129841/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7711_BAT -> XEIGTPW_10667_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10667_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7711/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10667/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  


Build changes
-------------

  * IGT: IGT_7711 -> IGTPW_10667
  * Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -> xe-771-65a621d44bec5a1ee7af20427215105e4c17e67f

  IGTPW_10667: 10667
  IGT_7711: 7711
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884
  xe-771-65a621d44bec5a1ee7af20427215105e4c17e67f: 65a621d44bec5a1ee7af20427215105e4c17e67f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10667/index.html

--===============8756830943382241171==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_multipipe_modeset: Run modeset and display enable for multidisplays</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129841/">https://patchwork.freedesktop.org/series/129841/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10667/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10667/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7711_BAT -&gt; XEIGTPW_10667_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10667_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7711/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10667/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7711 -&gt; IGTPW_10667</li>
<li>Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -&gt; xe-771-65a621d44bec5a1ee7af20427215105e4c17e67f</li>
</ul>
<p>IGTPW_10667: 10667<br />
  IGT_7711: 7711<br />
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884<br />
  xe-771-65a621d44bec5a1ee7af20427215105e4c17e67f: 65a621d44bec5a1ee7af20427215105e4c17e67f</p>

</body>
</html>

--===============8756830943382241171==--
