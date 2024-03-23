Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2C6C54E64
	for <igt-dev@archiver.kernel.org>; Sat, 23 Mar 2024 00:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7F10E775;
	Sat, 23 Mar 2024 00:19:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9410E775;
 Sat, 23 Mar 2024 00:19:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4605488487077368761=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=5Fvm=3A_DRM=5FXE=5FVM?=
 =?utf-8?q?=5FBIND=5FFLAG=5FDUMPABLE_is_now_a_valid_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Mar 2024 00:19:45 -0000
Message-ID: <171115318505.962476.3944312201719630425@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322205327.850864-1-matthew.d.roper@intel.com>
In-Reply-To: <20240322205327.850864-1-matthew.d.roper@intel.com>
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

--===============4605488487077368761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a valid flag
URL   : https://patchwork.freedesktop.org/series/131520/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7778_BAT -> XEIGTPW_10890_BAT
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

  Here are the changes found in XEIGTPW_10890_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1259]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7778/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * IGT: IGT_7778 -> IGTPW_10890
  * Linux: xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88 -> xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1

  IGTPW_10890: 10890
  IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88: b89042d4d087c1e037c1f7904b4c223e48919b88
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/index.html

--===============4605488487077368761==
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
<tr><td><b>Series:</b></td><td>tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a valid flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131520/">https://patchwork.freedesktop.org/series/131520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7778_BAT -&gt; XEIGTPW_10890_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10890_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7778/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7778 -&gt; IGTPW_10890</li>
<li>Linux: xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88 -&gt; xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1</li>
</ul>
<p>IGTPW_10890: 10890<br />
  IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88: b89042d4d087c1e037c1f7904b4c223e48919b88<br />
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1</p>

</body>
</html>

--===============4605488487077368761==--
