Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F068BC47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 16:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527BB10F43D;
	Thu, 25 Jan 2024 16:40:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE0210F192;
 Thu, 25 Jan 2024 16:40:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8197773158003043801=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_d3_mmap_test_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Thu, 25 Jan 2024 16:40:26 -0000
Message-ID: <170620082683.709515.3728973846115565577@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125154114.2164080-1-anshuman.gupta@intel.com>
In-Reply-To: <20240125154114.2164080-1-anshuman.gupta@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============8197773158003043801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add d3 mmap test (rev6)
URL   : https://patchwork.freedesktop.org/series/124115/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7692_BAT -> XEIGTPW_10589_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10589_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm@d3-mmap-system} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@xe_pm@d3-mmap-system.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-dg2-oem2/igt@xe_pm@d3-mmap-system.html

  * {igt@xe_pm@d3-mmap-vram} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@xe_pm@d3-mmap-vram.html

  
New tests
---------

  New tests have been introduced between XEIGT_7692_BAT and XEIGTPW_10589_BAT:

### New IGT tests (2) ###

  * igt@xe_pm@d3-mmap-system:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [0.18, 10.58] s

  * igt@xe_pm@d3-mmap-vram:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.32, 3.96] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10589_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][4] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][5] ([Intel XE#455])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][6] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][7] ([Intel XE#455])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7692 -> IGTPW_10589
  * Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -> xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a

  IGTPW_10589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/index.html
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/index.html

--===============8197773158003043801==
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
<tr><td><b>Series:</b></td><td>Add d3 mmap test (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124115/">https://patchwork.freedesktop.org/series/124115/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7692_BAT -&gt; XEIGTPW_10589_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10589_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pm@d3-mmap-system} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-dg2-oem2/igt@xe_pm@d3-mmap-system.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@d3-mmap-vram} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@xe_pm@d3-mmap-vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7692_BAT and XEIGTPW_10589_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [0.18, 10.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.32, 3.96] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10589_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10589/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7692 -&gt; IGTPW_10589</li>
<li>Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -&gt; xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a</li>
</ul>
<p>IGTPW_10589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/index.html<br />
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a<br />
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a</p>

</body>
</html>

--===============8197773158003043801==--
