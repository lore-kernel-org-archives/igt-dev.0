Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE309C3601E
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 00:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0884E10E19A;
	Fri, 11 Apr 2025 00:18:30 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7699E10E09C;
 Fri, 11 Apr 2025 00:18:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4350941543791323638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/kmod=3A_unbind=2C_bind?=
 =?utf-8?q?=2C_rebind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Apr 2025 00:18:29 -0000
Message-ID: <174433070947.2150.6692487962333308613@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
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

--===============4350941543791323638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kmod: unbind, bind, rebind
URL   : https://patchwork.freedesktop.org/series/147560/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8315_BAT -> XEIGTPW_12960_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12960_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#4624])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8315/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12960/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * IGT: IGT_8315 -> IGTPW_12960
  * Linux: xe-2932-c56353870b17912f7d08fee2736fe7a740421b07 -> xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb

  IGTPW_12960: 601e840b91a64f07757cd2a22e453ff19fd4a0ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2932-c56353870b17912f7d08fee2736fe7a740421b07: c56353870b17912f7d08fee2736fe7a740421b07
  xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb: 00a3cb4f4ab069fae5ccd844f89f2962cc0283bb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12960/index.html

--===============4350941543791323638==
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
<tr><td><b>Series:</b></td><td>lib/kmod: unbind, bind, rebind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147560/">https://patchwork.freedesktop.org/series/147560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12960/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12960/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8315_BAT -&gt; XEIGTPW_12960_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12960_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8315/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12960/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8315 -&gt; IGTPW_12960</li>
<li>Linux: xe-2932-c56353870b17912f7d08fee2736fe7a740421b07 -&gt; xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb</li>
</ul>
<p>IGTPW_12960: 601e840b91a64f07757cd2a22e453ff19fd4a0ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2932-c56353870b17912f7d08fee2736fe7a740421b07: c56353870b17912f7d08fee2736fe7a740421b07<br />
  xe-2933-00a3cb4f4ab069fae5ccd844f89f2962cc0283bb: 00a3cb4f4ab069fae5ccd844f89f2962cc0283bb</p>

</body>
</html>

--===============4350941543791323638==--
