Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB3C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 09:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84331123AC;
	Thu, 28 Mar 2024 09:51:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87C41123AC;
 Thu, 28 Mar 2024 09:51:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5526502132728287398=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_revamp_big_joiner_test_=28rev1?=
 =?utf-8?q?0=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Mar 2024 09:51:02 -0000
Message-ID: <171161946282.1061727.6712471881366048100@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328083939.1361225-1-kunal1.joshi@intel.com>
In-Reply-To: <20240328083939.1361225-1-kunal1.joshi@intel.com>
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

--===============5526502132728287398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test (rev10)
URL   : https://patchwork.freedesktop.org/series/130572/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7786_BAT -> XEIGTPW_10940_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_10940_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1130]) -> [PASS][2] +13 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#1132]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1130]) -> [TIMEOUT][6] ([Intel XE#1027] / [Intel XE#1088])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1130]) -> [DMESG-WARN][8] ([Intel XE#1088] / [Intel XE#1373])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#1130]) -> [INCOMPLETE][10] ([Intel XE#1027] / [Intel XE#804])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#1130]) -> [INCOMPLETE][12] ([Intel XE#804])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7786 -> IGTPW_10940
  * Linux: xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163 -> xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792

  IGTPW_10940: d6a638c30eb1f6715f7d56727f64fceab692f4a7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792: 8d398ffc40ac37d1589214c28b69c651c1a20792
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/index.html

--===============5526502132728287398==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7786_BAT -&gt; XEIGTPW_10940_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10940_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7786/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10940/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7786 -&gt; IGTPW_10940</li>
<li>Linux: xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163 -&gt; xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792</li>
</ul>
<p>IGTPW_10940: d6a638c30eb1f6715f7d56727f64fceab692f4a7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792: 8d398ffc40ac37d1589214c28b69c651c1a20792<br />
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163</p>

</body>
</html>

--===============5526502132728287398==--
