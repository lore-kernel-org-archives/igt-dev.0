Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2963E68946
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 01:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D8E10E825;
	Thu, 31 Oct 2024 01:57:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E947F10E824;
 Thu, 31 Oct 2024 01:57:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4933102745790706184=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fkmod=3A_stop_using_K?=
 =?utf-8?q?MOD=5FREMOVE=5FFORCE=2C_again?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 01:57:50 -0000
Message-ID: <173033987092.1364824.4655597674286061488@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030234908.858018-1-lucas.demarchi@intel.com>
In-Reply-To: <20241030234908.858018-1-lucas.demarchi@intel.com>
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

--===============4933102745790706184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again
URL   : https://patchwork.freedesktop.org/series/140745/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8089_BAT -> XEIGTPW_12010_BAT
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

  Here are the changes found in XEIGTPW_12010_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#2229]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#2229]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][6] ([Intel XE#2496]) -> [PASS][7] +31 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][8] ([Intel XE#886]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [DMESG-WARN][10] ([Intel XE#3295]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [SKIP][12] ([Intel XE#1192]) -> [PASS][13] +2 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][14] ([Intel XE#1192]) -> [PASS][15] +2 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [SKIP][16] ([Intel XE#1192]) -> [PASS][17] +2 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [DMESG-WARN][18] ([Intel XE#3295]) -> [PASS][19] +6 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [DMESG-WARN][20] ([Intel XE#3295]) -> [PASS][21] +2 other tests pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_module_load@load.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8089 -> IGTPW_12010
  * Linux: xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4 -> xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3

  IGTPW_12010: 12010
  IGT_8089: 2339a396e8c38ba1582a6fc18fe4f7ed178979cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4
  xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3: c245557007af0a1c23da00c47732ae1dadda7dd3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/index.html

--===============4933102745790706184==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140745/">https://patchwork.freedesktop.org/series/140745/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8089_BAT -&gt; XEIGTPW_12010_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12010_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> +6 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8089/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12010/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8089 -&gt; IGTPW_12010</li>
<li>Linux: xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4 -&gt; xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3</li>
</ul>
<p>IGTPW_12010: 12010<br />
  IGT_8089: 2339a396e8c38ba1582a6fc18fe4f7ed178979cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4<br />
  xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3: c245557007af0a1c23da00c47732ae1dadda7dd3</p>

</body>
</html>

--===============4933102745790706184==--
