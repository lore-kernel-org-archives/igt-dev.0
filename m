Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FFAC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 20:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DBB1120A5;
	Fri, 19 Apr 2024 20:16:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371551120A4;
 Fri, 19 Apr 2024 20:16:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6454089454360181545=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/gem=5Fexec=5Fcaptu?=
 =?utf-8?q?re=3A_fix_use_of_igt=5Fallow=5Fhang=28=29_/_igt=5Fdisallow=5Fhang?=
 =?utf-8?q?=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Apr 2024 20:16:39 -0000
Message-ID: <171355779922.1536668.11658457170894834546@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240411191934.10368-1-me@petersenna.com>
In-Reply-To: <20240411191934.10368-1-me@petersenna.com>
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

--===============6454089454360181545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang() (rev2)
URL   : https://patchwork.freedesktop.org/series/132330/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7814_BAT -> XEIGTPW_11045_BAT
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

  Here are the changes found in XEIGTPW_11045_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1259] / [Intel XE#1473])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [TIMEOUT][3] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473


Build changes
-------------

  * IGT: IGT_7814 -> IGTPW_11045
  * Linux: xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21 -> xe-1128-1501acd2d215fa1cc15a93c5bedc40d4776ed696

  IGTPW_11045: 39d6c504f49565054cc3ead0e7147105c67db1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7814: 7814
  xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21: 915273abf8b69731107af5c86fc8c6014d2b4f21
  xe-1128-1501acd2d215fa1cc15a93c5bedc40d4776ed696: 1501acd2d215fa1cc15a93c5bedc40d4776ed696

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/index.html

--===============6454089454360181545==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132330/">https://patchwork.freedesktop.org/series/132330/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7814_BAT -&gt; XEIGTPW_11045_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11045_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11045/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7814 -&gt; IGTPW_11045</li>
<li>Linux: xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21 -&gt; xe-1128-1501acd2d215fa1cc15a93c5bedc40d4776ed696</li>
</ul>
<p>IGTPW_11045: 39d6c504f49565054cc3ead0e7147105c67db1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7814: 7814<br />
  xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21: 915273abf8b69731107af5c86fc8c6014d2b4f21<br />
  xe-1128-1501acd2d215fa1cc15a93c5bedc40d4776ed696: 1501acd2d215fa1cc15a93c5bedc40d4776ed696</p>

</body>
</html>

--===============6454089454360181545==--
