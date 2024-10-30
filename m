Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C73BD6B6DB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 21:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4528610E0FD;
	Wed, 30 Oct 2024 21:42:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EE810E0FD;
 Wed, 30 Oct 2024 21:42:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8752312027292904328=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_debugfs_SR-IOV_helpers=3B_?=
 =?utf-8?q?Improve_clear-lmem_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Oct 2024 21:42:29 -0000
Message-ID: <173032454956.1364410.2754520039041765028@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
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

--===============8752312027292904328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add debugfs SR-IOV helpers; Improve clear-lmem check
URL   : https://patchwork.freedesktop.org/series/140733/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8089_BAT -> XEIGTPW_12006_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12006_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#2229]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#2229]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][6] ([Intel XE#886]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [DMESG-WARN][8] ([Intel XE#3295]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [SKIP][10] ([Intel XE#1192]) -> [PASS][11] +2 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][12] ([Intel XE#1192]) -> [PASS][13] +2 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [SKIP][14] ([Intel XE#1192]) -> [PASS][15] +2 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [DMESG-WARN][16] ([Intel XE#3295]) -> [PASS][17] +6 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [DMESG-WARN][18] ([Intel XE#3295]) -> [PASS][19] +2 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_module_load@load.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8089 -> IGTPW_12006
  * Linux: xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4 -> xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3

  IGTPW_12006: b2f5e9e20b50a89f741ef5dd38e3f4a1850cb956 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8089: 2339a396e8c38ba1582a6fc18fe4f7ed178979cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4
  xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3: c245557007af0a1c23da00c47732ae1dadda7dd3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/index.html

--===============8752312027292904328==
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
<tr><td><b>Series:</b></td><td>Add debugfs SR-IOV helpers; Improve clear-lmem check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140733/">https://patchwork.freedesktop.org/series/140733/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8089_BAT -&gt; XEIGTPW_12006_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12006_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> +6 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12006/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8089 -&gt; IGTPW_12006</li>
<li>Linux: xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4 -&gt; xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3</li>
</ul>
<p>IGTPW_12006: b2f5e9e20b50a89f741ef5dd38e3f4a1850cb956 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8089: 2339a396e8c38ba1582a6fc18fe4f7ed178979cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4<br />
  xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3: c245557007af0a1c23da00c47732ae1dadda7dd3</p>

</body>
</html>

--===============8752312027292904328==--
