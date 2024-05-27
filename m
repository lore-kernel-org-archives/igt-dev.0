Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0CCC25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 05:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D910F8B5;
	Mon, 27 May 2024 05:37:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A478B10F8C2;
 Mon, 27 May 2024 05:37:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2903977505357827609=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Update_kms=5Fplane_test_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 05:37:13 -0000
Message-ID: <171678823367.2211934.4740144675402762719@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524084807.480971-1-pranay.samala@intel.com>
In-Reply-To: <20240524084807.480971-1-pranay.samala@intel.com>
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

--===============2903977505357827609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update kms_plane test (rev2)
URL   : https://patchwork.freedesktop.org/series/134006/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7871_BAT -> XEIGTPW_11194_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11194_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11194_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11194_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-adlp-7:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-adlp-7/igt@runner@aborted.html
    - bat-pvc-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-pvc-2/igt@runner@aborted.html

  * igt@xe_exec_compute_mode@twice-userptr:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11194_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [ABORT][5] ([Intel XE#1908]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939


Build changes
-------------

  * IGT: IGT_7871 -> IGTPW_11194
  * Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -> xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c

  IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90
  xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c: ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/index.html

--===============2903977505357827609==
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
<tr><td><b>Series:</b></td><td>Update kms_plane test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134006/">https://patchwork.freedesktop.org/series/134006/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7871_BAT -&gt; XEIGTPW_11194_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11194_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11194_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11194_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-adlp-7/igt@runner@aborted.html">FAIL</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-pvc-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11194_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11194/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7871 -&gt; IGTPW_11194</li>
<li>Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -&gt; xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c</li>
</ul>
<p>IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90<br />
  xe-1343-ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c: ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c</p>

</body>
</html>

--===============2903977505357827609==--
