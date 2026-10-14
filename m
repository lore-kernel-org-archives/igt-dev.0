Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6B4CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 16:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC9A10FF02;
	Wed, 14 Oct 2026 16:05:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB8810FE89;
 Wed, 14 Oct 2026 16:04:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4490306249411000781=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fpmu=3A_Do_not_enable_V?=
 =?utf-8?q?Fs_in_unrelated_subtests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2026 16:04:47 -0000
Message-ID: <179199388723.24527.15262932509815098151@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
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

--===============4490306249411000781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_pmu: Do not enable VFs in unrelated subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/176050/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9145_BAT -> XEIGTPW_15985_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 12)
------------------------------

  Missing    (3): bat-bmg-2 bat-bmg-vm bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_15985_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][1] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9145 -> IGTPW_15985
  * Linux: xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 -> xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662

  IGTPW_15985: 3bbee583e719cdf3016db4eca927768d19d71425 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html

--===============4490306249411000781==
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
<tr><td><b>Series:</b></td><td>xe_pmu: Do not enable VFs in unrelated subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176050/">https://patchwork.freedesktop.org/series/176050/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9145_BAT -&gt; XEIGTPW_15985_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 12)</h2>
<p>Missing    (3): bat-bmg-2 bat-bmg-vm bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15985_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9145/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15985/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9145 -&gt; IGTPW_15985</li>
<li>Linux: xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 -&gt; xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662</li>
</ul>
<p>IGTPW_15985: 3bbee583e719cdf3016db4eca927768d19d71425 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5945-9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6<br />
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662</p>

</body>
</html>

--===============4490306249411000781==--
