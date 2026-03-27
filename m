Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6DC10BA426
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 06:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03010EC80;
	Fri, 27 Mar 2026 06:32:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358D910EC80;
 Fri, 27 Mar 2026 06:32:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6531896347056761175=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fpat=3A_add_hard?=
 =?utf-8?q?coded_PAT_fallback_for_older_kernels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 06:32:43 -0000
Message-ID: <177459316319.404950.4153245806066829491@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327052212.27431-1-himanshu.girotra@intel.com>
In-Reply-To: <20260327052212.27431-1-himanshu.girotra@intel.com>
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

--===============6531896347056761175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_pat: add hardcoded PAT fallback for older kernels
URL   : https://patchwork.freedesktop.org/series/163963/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_BAT -> XEIGTPW_14870_BAT
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

  Here are the changes found in XEIGTPW_14870_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [DMESG-WARN][1] ([Intel XE#7433]) -> [ABORT][2] ([Intel XE#7249] / [Intel XE#7578])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14870/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14870
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b

  IGTPW_14870: 944293f093a579d387e2f6566bd32dac1c9ff9bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14870/index.html

--===============6531896347056761175==
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
<tr><td><b>Series:</b></td><td>lib/intel_pat: add hardcoded PAT fallback for older kernels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163963/">https://patchwork.freedesktop.org/series/163963/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14870/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14870/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_BAT -&gt; XEIGTPW_14870_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14870_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14870/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14870</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b</li>
</ul>
<p>IGTPW_14870: 944293f093a579d387e2f6566bd32dac1c9ff9bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b</p>

</body>
</html>

--===============6531896347056761175==--
