Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826E3C61CE7
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 17:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162E910E3BD;
	Fri,  6 Jun 2025 17:40:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B54210E3BD;
 Fri,  6 Jun 2025 17:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0976627115862316593=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_render-node=2C_gt_reset?=
 =?utf-8?q?_and_suspend_engine_activity_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Jun 2025 17:40:28 -0000
Message-ID: <174923162829.56919.11066428928222997283@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606101008.1949955-1-riana.tauro@intel.com>
In-Reply-To: <20250606101008.1949955-1-riana.tauro@intel.com>
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

--===============0976627115862316593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add render-node, gt reset and suspend engine activity tests (rev3)
URL   : https://patchwork.freedesktop.org/series/149526/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8401_BAT -> XEIGTPW_13253_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13253_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8401/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13253/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8401 -> IGTPW_13253
  * Linux: xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5 -> xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77

  IGTPW_13253: 8801ec6eb89a5a45f05dc221c360d877f7f77b4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8401: 8401
  xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5: 8c96c8b7753fa6146836b12a379a53cac71894c5
  xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77: 2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13253/index.html

--===============0976627115862316593==
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
<tr><td><b>Series:</b></td><td>Add render-node, gt reset and suspend engine activity tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149526/">https://patchwork.freedesktop.org/series/149526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13253/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13253/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8401_BAT -&gt; XEIGTPW_13253_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13253_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8401/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13253/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8401 -&gt; IGTPW_13253</li>
<li>Linux: xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5 -&gt; xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77</li>
</ul>
<p>IGTPW_13253: 8801ec6eb89a5a45f05dc221c360d877f7f77b4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8401: 8401<br />
  xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5: 8c96c8b7753fa6146836b12a379a53cac71894c5<br />
  xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77: 2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77</p>

</body>
</html>

--===============0976627115862316593==--
