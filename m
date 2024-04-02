Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D0AC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 12:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262FC10FCBF;
	Tue,  2 Apr 2024 12:10:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418310FCBF;
 Tue,  2 Apr 2024 12:10:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2050241805920458981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_scripts/doc=5Fto=5Fxls=2Epy=3A?=
 =?utf-8?q?_fix_spreadsheet_generation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 12:10:04 -0000
Message-ID: <171205980453.1154304.12303770764284922814@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
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

--===============2050241805920458981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/doc_to_xls.py: fix spreadsheet generation
URL   : https://patchwork.freedesktop.org/series/131921/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7794_BAT -> XEIGTPW_10964_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10964_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1458])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#1177]) +54 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#1457]) +131 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#378])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][9] ([Intel XE#455]) -> [SKIP][10] ([Intel XE#1177])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#616]) -> [SKIP][12] ([Intel XE#1177])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][13] ([Intel XE#688]) -> [SKIP][14] ([Intel XE#1457]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][15] ([Intel XE#1008]) -> [SKIP][16] ([Intel XE#1457])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_mmap@vram.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#977]) -> [SKIP][18] ([Intel XE#1457])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         [SKIP][19] ([Intel XE#979]) -> [SKIP][20] ([Intel XE#1457]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457
  [Intel XE#1458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7794 -> IGTPW_10964
  * Linux: xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d -> xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d

  IGTPW_10964: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/index.html
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d
  xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d: f54ea7473cd118eb39978f2e946b17558b5ff46d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/index.html

--===============2050241805920458981==
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
<tr><td><b>Series:</b></td><td>scripts/doc_to_xls.py: fix spreadsheet generation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131921/">https://patchwork.freedesktop.org/series/131921/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7794_BAT -&gt; XEIGTPW_10964_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10964_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458">Intel XE#1458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7794/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10964/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7794 -&gt; IGTPW_10964</li>
<li>Linux: xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d -&gt; xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d</li>
</ul>
<p>IGTPW_10964: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/index.html<br />
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d<br />
  xe-1025-f54ea7473cd118eb39978f2e946b17558b5ff46d: f54ea7473cd118eb39978f2e946b17558b5ff46d</p>

</body>
</html>

--===============2050241805920458981==--
