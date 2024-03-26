Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B06BCD1280
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 20:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C355710F2BF;
	Tue, 26 Mar 2024 20:31:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967A10F2BA;
 Tue, 26 Mar 2024 20:31:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4181142746834856713=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5B1/3=5D?=
 =?utf-8?q?_tests/amdgpu/amd=5Fdp=5Fdsc=3A_Correct_code_style_problems_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hung, Alex" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 20:31:19 -0000
Message-ID: <171148507917.1054169.8902673307498698311@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321224758.1531610-1-alex.hung@amd.com>
In-Reply-To: <20240321224758.1531610-1-alex.hung@amd.com>
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

--===============4181142746834856713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems (rev2)
URL   : https://patchwork.freedesktop.org/series/131456/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7785_BAT -> XEIGTPW_10920_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10920_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][1] ([Intel XE#1088] / [Intel XE#1373])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][2] ([Intel XE#804])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [INCOMPLETE][3] ([Intel XE#804]) -> [TIMEOUT][4] ([Intel XE#1027] / [Intel XE#1088])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][5] ([Intel XE#1044]) -> [INCOMPLETE][6] ([Intel XE#1044] / [Intel XE#1376])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7785 -> IGTPW_10920

  IGTPW_10920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10920/index.html
  IGT_7785: 7785
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/index.html

--===============4181142746834856713==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131456/">https://patchwork.freedesktop.org/series/131456/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7785_BAT -&gt; XEIGTPW_10920_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10920_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10920/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7785 -&gt; IGTPW_10920</li>
</ul>
<p>IGTPW_10920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10920/index.html<br />
  IGT_7785: 7785<br />
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c</p>

</body>
</html>

--===============4181142746834856713==--
