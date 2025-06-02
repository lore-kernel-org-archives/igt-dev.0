Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B25C5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 21:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD410E592;
	Mon,  2 Jun 2025 21:21:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282710E592;
 Mon,  2 Jun 2025 21:21:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0667515465241179959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=3A_Add_test_for_engines?=
 =?utf-8?q?=5Fallowed_in_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Jun 2025 21:21:07 -0000
Message-ID: <174889926772.42009.8147197698086361721@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
In-Reply-To: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
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

--===============0667515465241179959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Add test for engines_allowed in configfs
URL   : https://patchwork.freedesktop.org/series/149742/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8390_BAT -> XEIGTPW_13226_BAT
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

  Here are the changes found in XEIGTPW_13226_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8390/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13226/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8390 -> IGTPW_13226
  * Linux: xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc -> xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062

  IGTPW_13226: 5fd7d047090f87209ef5ce16089d7b7e2dfb2015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8390: 8390
  xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc: b0d3f3958b8e3136100332939086983195e6a8cc
  xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062: 744ae62da6c761bb36669b38e24b5c5062c78062

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13226/index.html

--===============0667515465241179959==
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
<tr><td><b>Series:</b></td><td>xe: Add test for engines_allowed in configfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149742/">https://patchwork.freedesktop.org/series/149742/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13226/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8390_BAT -&gt; XEIGTPW_13226_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13226_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8390/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13226/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8390 -&gt; IGTPW_13226</li>
<li>Linux: xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc -&gt; xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062</li>
</ul>
<p>IGTPW_13226: 5fd7d047090f87209ef5ce16089d7b7e2dfb2015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8390: 8390<br />
  xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc: b0d3f3958b8e3136100332939086983195e6a8cc<br />
  xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062: 744ae62da6c761bb36669b38e24b5c5062c78062</p>

</body>
</html>

--===============0667515465241179959==--
