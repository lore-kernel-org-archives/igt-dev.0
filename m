Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C970DC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 07:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8A10F65E;
	Wed, 27 Mar 2024 07:51:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E20310ECA1;
 Wed, 27 Mar 2024 07:51:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3567658216561817233=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_memory_access_issue_due_to?=
 =?utf-8?q?_variable_block_scope_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Mar 2024 07:51:04 -0000
Message-ID: <171152586445.1055296.1904502900783232897@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327065928.5522-1-me@petersenna.com>
In-Reply-To: <20240327065928.5522-1-me@petersenna.com>
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

--===============3567658216561817233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix memory access issue due to variable block scope (rev4)
URL   : https://patchwork.freedesktop.org/series/131602/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7785_BAT -> XEIGTPW_10926_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10926_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_mmap@vram:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-lnl-1/igt@xe_mmap@vram.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10926_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][2] ([Intel XE#1373])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][3] ([Intel XE#1027] / [Intel XE#804])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][4] ([Intel XE#804])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [INCOMPLETE][5] ([Intel XE#804]) -> [TIMEOUT][6] ([Intel XE#1027] / [Intel XE#1088])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7785 -> IGTPW_10926
  * Linux: xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c -> xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163

  IGTPW_10926: 10926
  IGT_7785: 7785
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/index.html

--===============3567658216561817233==
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
<tr><td><b>Series:</b></td><td>Fix memory access issue due to variable block scope (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131602/">https://patchwork.freedesktop.org/series/131602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7785_BAT -&gt; XEIGTPW_10926_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10926_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_mmap@vram:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10926_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7785/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10926/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7785 -&gt; IGTPW_10926</li>
<li>Linux: xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c -&gt; xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163</li>
</ul>
<p>IGTPW_10926: 10926<br />
  IGT_7785: 7785<br />
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c<br />
  xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163</p>

</body>
</html>

--===============3567658216561817233==--
