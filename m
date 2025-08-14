Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF3ECA0ED1
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 04:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447510E212;
	Thu, 14 Aug 2025 04:20:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFEF10E7EE;
 Thu, 14 Aug 2025 04:20:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5675212966575630417=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_lib/amdgpu=3A_add_ASIC-aware_gfx_hooks_and_introduce_amd=5Fip?=
 =?utf-8?q?=5Fblocks=5Fex?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Aug 2025 04:20:25 -0000
Message-ID: <175514522530.235440.17837237882963425934@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250814031807.109119-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250814031807.109119-1-vitaly.prosyak@amd.com>
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

--===============5675212966575630417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib/amdgpu: add ASIC-aware gfx hooks and introduce amd_ip_blocks_ex
URL   : https://patchwork.freedesktop.org/series/152922/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8493_BAT -> XEIGTPW_13581_BAT
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

  Here are the changes found in XEIGTPW_13581_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8493 -> IGTPW_13581
  * Linux: xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736 -> xe-3542-9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b

  IGTPW_13581: 21918d7fa1f059ed21c50f7190d3ab6e797e079c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8493: 8493
  xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736: 6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736
  xe-3542-9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b: 9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13581/index.html

--===============5675212966575630417==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib/amdgpu: add ASIC-aware gfx hooks and introduce amd_ip_blocks_ex</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152922/">https://patchwork.freedesktop.org/series/152922/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13581/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13581/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8493_BAT -&gt; XEIGTPW_13581_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13581_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8493 -&gt; IGTPW_13581</li>
<li>Linux: xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736 -&gt; xe-3542-9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b</li>
</ul>
<p>IGTPW_13581: 21918d7fa1f059ed21c50f7190d3ab6e797e079c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8493: 8493<br />
  xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736: 6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736<br />
  xe-3542-9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b: 9f8edd9ae9e48fd4a6599e4aa2e48f5da55a697b</p>

</body>
</html>

--===============5675212966575630417==--
