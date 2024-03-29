Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B79CD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 17:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C01D112818;
	Fri, 29 Mar 2024 17:58:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C37A112814;
 Fri, 29 Mar 2024 17:58:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3141727908081067538=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Align_Xe_header_and_restore_so?=
 =?utf-8?q?me_uAPI_flags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Mar 2024 17:58:54 -0000
Message-ID: <171173513411.1081852.13045840276757501662@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329153058.7-1-francois.dugast@intel.com>
In-Reply-To: <20240329153058.7-1-francois.dugast@intel.com>
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

--===============3141727908081067538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Align Xe header and restore some uAPI flags
URL   : https://patchwork.freedesktop.org/series/131816/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7791_BAT -> XEIGTPW_10952_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10952_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10952_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10952_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][3] +9 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  
New tests
---------

  New tests have been introduced between XEIGT_7791_BAT and XEIGTPW_10952_BAT:

### New IGT tests (5) ###

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10952_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#288]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#288]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#288]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7791 -> IGTPW_10952
  * Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -> xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0

  IGTPW_10952: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10952/index.html
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4
  xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0: 15fe5f853b066bf84109866c9a1e4bc0bc15faf0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/index.html

--===============3141727908081067538==
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
<tr><td><b>Series:</b></td><td>Align Xe header and restore some uAPI flags</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131816/">https://patchwork.freedesktop.org/series/131816/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7791_BAT -&gt; XEIGTPW_10952_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10952_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10952_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10952_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">FAIL</a> +9 other tests fail</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7791_BAT and XEIGTPW_10952_BAT:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10952_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10952/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7791 -&gt; IGTPW_10952</li>
<li>Linux: xe-1016-96000ec64d7e08436f2cafc89711c907576710f4 -&gt; xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0</li>
</ul>
<p>IGTPW_10952: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10952/index.html<br />
  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1016-96000ec64d7e08436f2cafc89711c907576710f4: 96000ec64d7e08436f2cafc89711c907576710f4<br />
  xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0: 15fe5f853b066bf84109866c9a1e4bc0bc15faf0</p>

</body>
</html>

--===============3141727908081067538==--
