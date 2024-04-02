Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ADBC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 11:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C7310FC82;
	Tue,  2 Apr 2024 11:40:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9D410FC82;
 Tue,  2 Apr 2024 11:40:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6887705280682865801=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Fabm=3A_Fix_?=
 =?utf-8?q?ABM_level_setting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 11:40:19 -0000
Message-ID: <171205801931.1154304.4609147886534375599@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402075208.21223-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240402075208.21223-1-chiahsuan.chung@amd.com>
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

--===============6887705280682865801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_abm: Fix ABM level setting
URL   : https://patchwork.freedesktop.org/series/131914/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7794_BAT -> XEIGTPW_10963_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10963_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_mmap@cpu-caching:
    - {bat-lnl-1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10963/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7794 -> IGTPW_10963
  * Linux: xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d -> xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d

  IGTPW_10963: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d
  xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d: f54ea7473cd118eb39978f2e946b17558b5ff46d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10963/index.html

--===============6887705280682865801==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_abm: Fix ABM level setting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131914/">https://patchwork.freedesktop.org/series/131914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10963/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10963/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7794_BAT -&gt; XEIGTPW_10963_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10963_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_mmap@cpu-caching:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10963/bat-lnl-1/igt@xe_mmap@cpu-caching.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7794 -&gt; IGTPW_10963</li>
<li>Linux: xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d -&gt; xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d</li>
</ul>
<p>IGTPW_10963: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10963/index.html<br />
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d<br />
  xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d: f54ea7473cd118eb39978f2e946b17558b5ff46d</p>

</body>
</html>

--===============6887705280682865801==--
