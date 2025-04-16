Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A721C369B9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 00:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CF510E030;
	Wed, 16 Apr 2025 00:21:39 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281210E030;
 Wed, 16 Apr 2025 00:21:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7395760607076374290=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Async_flips_with_tiled_modi?=
 =?utf-8?q?fiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Apr 2025 00:21:37 -0000
Message-ID: <174476289798.8472.659118493836453841@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
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

--===============7395760607076374290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Async flips with tiled modifiers
URL   : https://patchwork.freedesktop.org/series/147775/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8320_BAT -> XEIGTPW_12983_BAT
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

  Here are the changes found in XEIGTPW_12983_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#4624])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8320/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12983/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * IGT: IGT_8320 -> IGTPW_12983
  * Linux: xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3 -> xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7

  IGTPW_12983: bf03e181d4b14161c0ad090393511054d32d67df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3: 22c34bd976f4b047263dafa7b88f60f953ccddd3
  xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7: b8f79cb562e983515cf827f0f336f79423b8d5a7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12983/index.html

--===============7395760607076374290==
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
<tr><td><b>Series:</b></td><td>Async flips with tiled modifiers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147775/">https://patchwork.freedesktop.org/series/147775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12983/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12983/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8320_BAT -&gt; XEIGTPW_12983_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12983_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-forcewake:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8320/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12983/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8320 -&gt; IGTPW_12983</li>
<li>Linux: xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3 -&gt; xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7</li>
</ul>
<p>IGTPW_12983: bf03e181d4b14161c0ad090393511054d32d67df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3: 22c34bd976f4b047263dafa7b88f60f953ccddd3<br />
  xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7: b8f79cb562e983515cf827f0f336f79423b8d5a7</p>

</body>
</html>

--===============7395760607076374290==--
