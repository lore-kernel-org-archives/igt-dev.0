Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB123C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 20:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B94F10E387;
	Tue, 15 Apr 2025 20:40:45 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1675A10E386;
 Tue, 15 Apr 2025 20:40:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1929830046065851995=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/1=5D_lib/xe/xe=5Feudebug=3A_skip_when_disabling_eudeb?=
 =?utf-8?q?ug_with_no_eudebug_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Apr 2025 20:40:45 -0000
Message-ID: <174474964507.8196.16256808872585176991@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415092217.11835-1-jan.sokolowski@intel.com>
In-Reply-To: <20250415092217.11835-1-jan.sokolowski@intel.com>
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

--===============1929830046065851995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/1] lib/xe/xe_eudebug: skip when disabling eudebug with no eudebug support
URL   : https://patchwork.freedesktop.org/series/147740/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8320_BAT -> XEIGTPW_12978_BAT
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

  Here are the changes found in XEIGTPW_12978_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#4624])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8320/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12978/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * IGT: IGT_8320 -> IGTPW_12978
  * Linux: xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3 -> xe-2956-b61f5de7570012cb79e72624a97b216d395f7380

  IGTPW_12978: 6e7bd3190cb51cea418987e59517f319614e25c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3: 22c34bd976f4b047263dafa7b88f60f953ccddd3
  xe-2956-b61f5de7570012cb79e72624a97b216d395f7380: b61f5de7570012cb79e72624a97b216d395f7380

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12978/index.html

--===============1929830046065851995==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/1] lib/xe/xe_eudebug: skip when disabling eudebug with no eudebug support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147740/">https://patchwork.freedesktop.org/series/147740/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12978/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12978/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8320_BAT -&gt; XEIGTPW_12978_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12978_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-forcewake:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8320/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12978/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8320 -&gt; IGTPW_12978</li>
<li>Linux: xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3 -&gt; xe-2956-b61f5de7570012cb79e72624a97b216d395f7380</li>
</ul>
<p>IGTPW_12978: 6e7bd3190cb51cea418987e59517f319614e25c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2954-22c34bd976f4b047263dafa7b88f60f953ccddd3: 22c34bd976f4b047263dafa7b88f60f953ccddd3<br />
  xe-2956-b61f5de7570012cb79e72624a97b216d395f7380: b61f5de7570012cb79e72624a97b216d395f7380</p>

</body>
</html>

--===============1929830046065851995==--
