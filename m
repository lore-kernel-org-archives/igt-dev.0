Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6766C36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 01:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F45910E597;
	Tue,  8 Apr 2025 01:02:50 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2F110E590;
 Tue,  8 Apr 2025 01:02:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6702496909354680959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Create_subtest_for_overlay_planes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Apr 2025 01:02:49 -0000
Message-ID: <174407416904.45717.14359281161102708767@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408000221.140459-1-andrealmeid@igalia.com>
In-Reply-To: <20250408000221.140459-1-andrealmeid@igalia.com>
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

--===============6702496909354680959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Create subtest for overlay planes
URL   : https://patchwork.freedesktop.org/series/147351/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8310_BAT -> XEIGTPW_12936_BAT
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

  Here are the changes found in XEIGTPW_12936_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2464]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#1008])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2468])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#3342])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        NOTRUN -> [ABORT][5] ([Intel XE#3970])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-adlp-vf:        [ABORT][6] ([Intel XE#3970]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8310/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8310 -> IGTPW_12936

  IGTPW_12936: 12936
  IGT_8310: 4b22256d016daa2f133092b62c03230ff121a3fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188: a33da369e8cde6c7208381a592866cd61f1ce188

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/index.html

--===============6702496909354680959==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Create subtest for overlay planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147351/">https://patchwork.freedesktop.org/series/147351/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8310_BAT -&gt; XEIGTPW_12936_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12936_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8310/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12936/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8310 -&gt; IGTPW_12936</li>
</ul>
<p>IGTPW_12936: 12936<br />
  IGT_8310: 4b22256d016daa2f133092b62c03230ff121a3fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188: a33da369e8cde6c7208381a592866cd61f1ce188</p>

</body>
</html>

--===============6702496909354680959==--
