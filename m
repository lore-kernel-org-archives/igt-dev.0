Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094BDC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 09:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BDB10E2F2;
	Thu, 23 May 2024 09:26:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6FB10E2F2;
 Thu, 23 May 2024 09:26:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1898261172788579370=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_check_drmModeGetConnector=28?=
 =?utf-8?q?=29_return_value_in_some_missing_places?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 May 2024 09:26:45 -0000
Message-ID: <171645640549.2169609.15811742476364682252@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523084426.284894-1-luciano.coelho@intel.com>
In-Reply-To: <20240523084426.284894-1-luciano.coelho@intel.com>
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

--===============1898261172788579370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: check drmModeGetConnector() return value in some missing places
URL   : https://patchwork.freedesktop.org/series/133953/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7869_BAT -> XEIGTPW_11181_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11181_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11181_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11181_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_atomic@basic-inc-all:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11181_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-dg2-oem2:       [PASS][6] -> [ABORT][7] ([Intel XE#1908])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [ABORT][8] ([Intel XE#1908]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_7869 -> IGTPW_11181
  * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1333-7643e429e72c546f3779339624df885f6160124c

  IGTPW_11181: 11181
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/index.html

--===============1898261172788579370==
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
<tr><td><b>Series:</b></td><td>check drmModeGetConnector() return value in some missing places</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133953/">https://patchwork.freedesktop.org/series/133953/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7869_BAT -&gt; XEIGTPW_11181_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11181_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11181_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11181_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11181_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-invalidate:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7869 -&gt; IGTPW_11181</li>
<li>Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -&gt; xe-1333-7643e429e72c546f3779339624df885f6160124c</li>
</ul>
<p>IGTPW_11181: 11181<br />
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921<br />
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c</p>

</body>
</html>

--===============1898261172788579370==--
