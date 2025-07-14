Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA712C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 23:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA3E10E0C2;
	Mon, 14 Jul 2025 23:33:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1121410E0C2;
 Mon, 14 Jul 2025 23:33:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0722840519035185778=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_System_allocator_test_fixes?=
 =?utf-8?q?=2C_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Jul 2025 23:33:05 -0000
Message-ID: <175253598506.160541.13967420906405971903@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714170309.2949211-1-matthew.brost@intel.com>
In-Reply-To: <20250714170309.2949211-1-matthew.brost@intel.com>
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

--===============0722840519035185778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: System allocator test fixes, improvements
URL   : https://patchwork.freedesktop.org/series/151581/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8457_BAT -> XEIGTPW_13466_BAT
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

  Here are the changes found in XEIGTPW_13466_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8457/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13466/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8457 -> IGTPW_13466
  * Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -> xe-3412-b012f04b5be909a307ff629b297387e0ed55195a

  IGTPW_13466: 4ef75d780cec709759ca7661f0f59571edd7f8fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629b297387e0ed55195a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13466/index.html

--===============0722840519035185778==
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
<tr><td><b>Series:</b></td><td>System allocator test fixes, improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151581/">https://patchwork.freedesktop.org/series/151581/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13466/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13466/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8457_BAT -&gt; XEIGTPW_13466_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13466_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8457/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13466/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8457 -&gt; IGTPW_13466</li>
<li>Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -&gt; xe-3412-b012f04b5be909a307ff629b297387e0ed55195a</li>
</ul>
<p>IGTPW_13466: 4ef75d780cec709759ca7661f0f59571edd7f8fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822<br />
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629b297387e0ed55195a</p>

</body>
</html>

--===============0722840519035185778==--
