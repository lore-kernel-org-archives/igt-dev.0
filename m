Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE36BCF31A7
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 11:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A410E5D8;
	Wed, 19 Nov 2025 11:20:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2710E5D7;
 Wed, 19 Nov 2025 11:20:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4134041640558507865=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=5Fresid?=
 =?utf-8?q?ency=3A_Add_ASPM_Link_residency_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Nov 2025 11:20:27 -0000
Message-ID: <176355122738.8710.6144299272613711390@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119095154.2501720-1-karthik.poosa@intel.com>
In-Reply-To: <20251119095154.2501720-1-karthik.poosa@intel.com>
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

--===============4134041640558507865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Add ASPM Link residency test (rev2)
URL   : https://patchwork.freedesktop.org/series/157057/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8632_BAT -> XEIGTPW_14080_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14080_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8632/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14080/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8632 -> IGTPW_14080
  * Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -> xe-4126-80939f90d3e68b92b868017ea450e6695f756666

  IGTPW_14080: 14080
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14080/index.html

--===============4134041640558507865==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Add ASPM Link residency test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157057/">https://patchwork.freedesktop.org/series/157057/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14080/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8632_BAT -&gt; XEIGTPW_14080_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14080_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8632/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14080/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8632 -&gt; IGTPW_14080</li>
<li>Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -&gt; xe-4126-80939f90d3e68b92b868017ea450e6695f756666</li>
</ul>
<p>IGTPW_14080: 14080<br />
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487<br />
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666</p>

</body>
</html>

--===============4134041640558507865==--
