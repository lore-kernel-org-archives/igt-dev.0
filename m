Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8804C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 22:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F16210E7D7;
	Thu,  1 Feb 2024 22:02:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC2810E801;
 Thu,  1 Feb 2024 22:02:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5444022752063546691=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/kunit=3A_Support_writable_?=
 =?utf-8?q?filter*_parameters_of_kunit_module_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Feb 2024 22:02:25 -0000
Message-ID: <170682494597.897306.10257394377953150617@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
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

--===============5444022752063546691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kunit: Support writable filter* parameters of kunit module (rev3)
URL   : https://patchwork.freedesktop.org/series/129174/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7701_BAT -> XEIGTPW_10629_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10629_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10629_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10629_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-adlp-7/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-adlp-7/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@migrate:
    - bat-pvc-2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-pvc-2/igt@xe_live_ktest@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-pvc-2/igt@xe_live_ktest@migrate.html
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
    - bat-atsm-2:         [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_live_ktest@migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-atsm-2/igt@xe_live_ktest@migrate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10629_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][9] ([Intel XE#1130]) -> [SKIP][10] ([Intel XE#288])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7701 -> IGTPW_10629

  IGTPW_10629: 10629
  IGT_7701: 7701
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/index.html

--===============5444022752063546691==
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
<tr><td><b>Series:</b></td><td>lib/kunit: Support writable filter* parameters of kunit module (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129174/">https://patchwork.freedesktop.org/series/129174/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7701_BAT -&gt; XEIGTPW_10629_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10629_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10629_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10629_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-adlp-7/igt@xe_live_ktest@bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-pvc-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-pvc-2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-atsm-2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10629_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7701/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10629/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7701 -&gt; IGTPW_10629</li>
</ul>
<p>IGTPW_10629: 10629<br />
  IGT_7701: 7701<br />
  xe-715-3e58a4940c44430f20cad20ead5e1b77ed209cde: 3e58a4940c44430f20cad20ead5e1b77ed209cde</p>

</body>
</html>

--===============5444022752063546691==--
