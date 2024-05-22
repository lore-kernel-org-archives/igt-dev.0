Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180CCC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7410EE91;
	Wed, 22 May 2024 12:19:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3180510EE91;
 Wed, 22 May 2024 12:19:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1111867290098913401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Ftlb=3A_Check_?=
 =?utf-8?q?TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 May 2024 12:19:16 -0000
Message-ID: <171638035619.2167033.1750860149658952062@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
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

--===============1111867290098913401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_tlb: Check TLB invalidation
URL   : https://patchwork.freedesktop.org/series/133911/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7867_BAT -> XEIGTPW_11176_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in XEIGTPW_11176_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] ([Intel XE#1908])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-atsm-2:         [DMESG-WARN][5] ([Intel XE#1908]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][7] ([Intel XE#1069]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908


Build changes
-------------

  * IGT: IGT_7867 -> IGTPW_11176
  * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -> xe-1325-60d912720ac9462b1170ace7f05f8af68f898204

  IGTPW_11176: cd14824e69fdc760b7376f39619ca8de8147563e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd
  xe-1325-60d912720ac9462b1170ace7f05f8af68f898204: 60d912720ac9462b1170ace7f05f8af68f898204

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html

--===============1111867290098913401==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_tlb: Check TLB invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133911/">https://patchwork.freedesktop.org/series/133911/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7867_BAT -&gt; XEIGTPW_11176_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11176_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7867 -&gt; IGTPW_11176</li>
<li>Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -&gt; xe-1325-60d912720ac9462b1170ace7f05f8af68f898204</li>
</ul>
<p>IGTPW_11176: cd14824e69fdc760b7376f39619ca8de8147563e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd<br />
  xe-1325-60d912720ac9462b1170ace7f05f8af68f898204: 60d912720ac9462b1170ace7f05f8af68f898204</p>

</body>
</html>

--===============1111867290098913401==--
