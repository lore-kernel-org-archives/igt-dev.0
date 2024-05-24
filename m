Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D1C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90210E0C3;
	Fri, 24 May 2024 08:36:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2FF10E0C3;
 Fri, 24 May 2024 08:36:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6851500647772657710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Introduce_SR-IOV_VM-level_test?=
 =?utf-8?q?ing_tool_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adam Miszczak" <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 May 2024 08:36:07 -0000
Message-ID: <171653976718.2172910.7720171744748243889@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524075029.235944-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20240524075029.235944-1-adam.miszczak@linux.intel.com>
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

--===============6851500647772657710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce SR-IOV VM-level testing tool (rev2)
URL   : https://patchwork.freedesktop.org/series/133950/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7871_BAT -> XEIGTPW_11187_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11187_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11187_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11187_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - bat-pvc-2:          [ABORT][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11187_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [ABORT][3] ([Intel XE#1908]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908


Build changes
-------------

  * IGT: IGT_7871 -> IGTPW_11187
  * Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -> xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09

  IGTPW_11187: 11187
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90
  xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09: 1385623a20ad940dab90bfaa4bc01fe599506e09

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/index.html

--===============6851500647772657710==
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
<tr><td><b>Series:</b></td><td>Introduce SR-IOV VM-level testing tool (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133950/">https://patchwork.freedesktop.org/series/133950/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7871_BAT -&gt; XEIGTPW_11187_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11187_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11187_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11187_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11187_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11187/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7871 -&gt; IGTPW_11187</li>
<li>Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -&gt; xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09</li>
</ul>
<p>IGTPW_11187: 11187<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90<br />
  xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09: 1385623a20ad940dab90bfaa4bc01fe599506e09</p>

</body>
</html>

--===============6851500647772657710==--
