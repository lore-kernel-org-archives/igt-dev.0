Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2707C982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E28710E6F8;
	Thu, 17 Sep 2026 15:30:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A210E6F8;
 Thu, 17 Sep 2026 15:29:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7868999350672336654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/igt=5Fcore=3A_Make_buil?=
 =?utf-8?q?d_reproducible_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 17 Sep 2026 15:29:37 -0000
Message-ID: <178965897771.177999.1175361365832700958@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
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

--===============7868999350672336654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Make build reproducible (rev3)
URL   : https://patchwork.freedesktop.org/series/173723/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9099_BAT -> XEIGTPW_15858_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15858_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15858_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15858_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-atsm-2/igt@kms_3d@basic.html

  * igt@runner@aborted:
    - bat-lnl-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15858_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d@basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#6011])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-1/igt@kms_3d@basic.html

  * igt@xe_waitfence@reltime:
    - bat-bmg-2:          [PASS][4] -> [FAIL][5] ([Intel XE#9115])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9099/bat-bmg-2/igt@xe_waitfence@reltime.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-bmg-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9099 -> IGTPW_15858
  * Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -> xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840

  IGTPW_15858: 15858
  IGT_9099: 9099
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8
  xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840: d4289677143a2d09ce25eb883b0bf16fd7135840

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/index.html

--===============7868999350672336654==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Make build reproducible (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173723/">https://patchwork.freedesktop.org/series/173723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9099_BAT -&gt; XEIGTPW_15858_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15858_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15858_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15858_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-atsm-2/igt@kms_3d@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15858_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-1/igt@kms_3d@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9099/bat-bmg-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-bmg-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9099 -&gt; IGTPW_15858</li>
<li>Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -&gt; xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840</li>
</ul>
<p>IGTPW_15858: 15858<br />
  IGT_9099: 9099<br />
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8<br />
  xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840: d4289677143a2d09ce25eb883b0bf16fd7135840</p>

</body>
</html>

--===============7868999350672336654==--
