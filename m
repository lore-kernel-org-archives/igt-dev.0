Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B010C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 06:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CCB10EC95;
	Wed, 22 May 2024 06:43:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8A110EC95;
 Wed, 22 May 2024 06:43:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4039531737518167526=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=3A_Implement?=
 =?utf-8?q?_dynamic_level_execution_across_multiple_planes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 May 2024 06:43:11 -0000
Message-ID: <171636019131.2165803.7861863470669994370@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522051118.468001-1-pranay.samala@intel.com>
In-Reply-To: <20240522051118.468001-1-pranay.samala@intel.com>
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

--===============4039531737518167526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Implement dynamic level execution across multiple planes (rev2)
URL   : https://patchwork.freedesktop.org/series/133839/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7867_BAT -> XEIGTPW_11173_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11173_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11173_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11173_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-atsm-2:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11173_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][2] -> [INCOMPLETE][3] ([Intel XE#1169])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-dg2-oem2:       [PASS][4] -> [ABORT][5] ([Intel XE#1908])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-atsm-2:         [DMESG-WARN][6] ([Intel XE#1908]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][8] ([Intel XE#1069]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7867 -> IGTPW_11173

  IGTPW_11173: 8aea6a45df44ef06c95401f9bc9e04c900f18980 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/index.html

--===============4039531737518167526==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Implement dynamic level execution across multiple planes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133839/">https://patchwork.freedesktop.org/series/133839/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7867_BAT -&gt; XEIGTPW_11173_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11173_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11173_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11173_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11173_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11173/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7867 -&gt; IGTPW_11173</li>
</ul>
<p>IGTPW_11173: 8aea6a45df44ef06c95401f9bc9e04c900f18980 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd</p>

</body>
</html>

--===============4039531737518167526==--
