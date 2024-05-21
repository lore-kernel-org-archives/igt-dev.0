Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE0C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 19:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E610F05A;
	Tue, 21 May 2024 19:41:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3D10ED59;
 Tue, 21 May 2024 19:41:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6446512455853852344=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5BCI=2C1?=
 =?utf-8?q?/6=5D_treewide=3A_Rename_engine_busyness_variables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 May 2024 19:41:48 -0000
Message-ID: <171632050817.2165265.12488584260435164904@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521161525.159720-1-lucas.demarchi@intel.com>
In-Reply-To: <20240521161525.159720-1-lucas.demarchi@intel.com>
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

--===============6446512455853852344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/6] treewide: Rename engine busyness variables
URL   : https://patchwork.freedesktop.org/series/133885/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7866_BAT -> XEIGTPW_11172_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11172_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11172_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11172_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - {bat-lnl-1}:        [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11172_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#255])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-rebind:
    - bat-atsm-2:         [ABORT][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-atsm-2/igt@xe_exec_compute_mode@twice-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-atsm-2/igt@xe_exec_compute_mode@twice-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255


Build changes
-------------

  * IGT: IGT_7866 -> IGTPW_11172
  * Linux: xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad -> xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6

  IGTPW_11172: a85841ffc80b7bfe3429bdf283c8e37b0762602d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad: 39e2349c88dab7b39cf2c9549783e9b1e03311ad
  xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/index.html

--===============6446512455853852344==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/6] treewide: Rename engine busyness variables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133885/">https://patchwork.freedesktop.org/series/133885/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7866_BAT -&gt; XEIGTPW_11172_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11172_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11172_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11172_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-invalidate:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11172_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_huc_copy@huc_copy:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7866/bat-atsm-2/igt@xe_exec_compute_mode@twice-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11172/bat-atsm-2/igt@xe_exec_compute_mode@twice-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7866 -&gt; IGTPW_11172</li>
<li>Linux: xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad -&gt; xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6</li>
</ul>
<p>IGTPW_11172: a85841ffc80b7bfe3429bdf283c8e37b0762602d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad: 39e2349c88dab7b39cf2c9549783e9b1e03311ad<br />
  xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6</p>

</body>
</html>

--===============6446512455853852344==--
