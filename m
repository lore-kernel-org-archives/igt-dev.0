Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA5C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 08:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46A10ED99;
	Thu, 22 May 2025 08:35:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A8E10ED99;
 Thu, 22 May 2025 08:35:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3443658784097228938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Refine_FBC_test_conditions_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 May 2025 08:35:33 -0000
Message-ID: <174790293309.12900.6924898486340290973@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
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

--===============3443658784097228938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refine FBC test conditions (rev2)
URL   : https://patchwork.freedesktop.org/series/149181/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8372_BAT -> XEIGTPW_13167_BAT
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

  Here are the changes found in XEIGTPW_13167_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8372/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13167/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8372 -> IGTPW_13167

  IGTPW_13167: 13167
  IGT_8372: 8372
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331ca1180a9dd2b5560b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13167/index.html

--===============3443658784097228938==
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
<tr><td><b>Series:</b></td><td>Refine FBC test conditions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149181/">https://patchwork.freedesktop.org/series/149181/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13167/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13167/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8372_BAT -&gt; XEIGTPW_13167_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13167_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8372/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13167/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8372 -&gt; IGTPW_13167</li>
</ul>
<p>IGTPW_13167: 13167<br />
  IGT_8372: 8372<br />
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331ca1180a9dd2b5560b</p>

</body>
</html>

--===============3443658784097228938==--
