Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A14DC282DE
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 01:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F44710E4F9;
	Tue, 11 Mar 2025 01:38:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B046610E4F3;
 Tue, 11 Mar 2025 01:38:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8430787284172757376=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_runner/kmemleak=3A_Remove_u?=
 =?utf-8?q?nnecessary_lseek=28=29_calls?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Mar 2025 01:38:29 -0000
Message-ID: <174165710971.16386.2204185413661427236@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
In-Reply-To: <20250310200220.233045-1-peter.senna@linux.intel.com>
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

--===============8430787284172757376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/kmemleak: Remove unnecessary lseek() calls
URL   : https://patchwork.freedesktop.org/series/146105/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8270_BAT -> XEIGTPW_12739_BAT
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

  Here are the changes found in XEIGTPW_12739_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        [ABORT][2] ([Intel XE#4491]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8270/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8270 -> IGTPW_12739
  * Linux: xe-2789-714f93e4c086c6e07187597bd446752f5f65b544 -> xe-2791-fd356d116b876e8778d2a52820c832f95dcdd3d5

  IGTPW_12739: 12739
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2789-714f93e4c086c6e07187597bd446752f5f65b544: 714f93e4c086c6e07187597bd446752f5f65b544
  xe-2791-fd356d116b876e8778d2a52820c832f95dcdd3d5: fd356d116b876e8778d2a52820c832f95dcdd3d5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/index.html

--===============8430787284172757376==
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
<tr><td><b>Series:</b></td><td>runner/kmemleak: Remove unnecessary lseek() calls</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146105/">https://patchwork.freedesktop.org/series/146105/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8270_BAT -&gt; XEIGTPW_12739_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12739_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-front:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8270/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8270 -&gt; IGTPW_12739</li>
<li>Linux: xe-2789-714f93e4c086c6e07187597bd446752f5f65b544 -&gt; xe-2791-fd356d116b876e8778d2a52820c832f95dcdd3d5</li>
</ul>
<p>IGTPW_12739: 12739<br />
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2789-714f93e4c086c6e07187597bd446752f5f65b544: 714f93e4c086c6e07187597bd446752f5f65b544<br />
  xe-2791-fd356d116b876e8778d2a52820c832f95dcdd3d5: fd356d116b876e8778d2a52820c832f95dcdd3d5</p>

</body>
</html>

--===============8430787284172757376==--
