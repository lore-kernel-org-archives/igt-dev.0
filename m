Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E38CCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9EE10E34C;
	Thu, 13 Nov 2025 07:57:51 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68A10E34C;
 Thu, 13 Nov 2025 07:57:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1494556851982749732=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fpat=3A_add?=
 =?utf-8?q?_helper_funtion_to_read_PAT_table?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang, X" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Nov 2025 07:57:49 -0000
Message-ID: <176302066989.48377.14934561935590921201@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251113070502.2148615-1-x.wang@intel.com>
In-Reply-To: <20251113070502.2148615-1-x.wang@intel.com>
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

--===============1494556851982749732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: add helper funtion to read PAT table
URL   : https://patchwork.freedesktop.org/series/157481/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8622_BAT -> XEIGTPW_14048_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14048_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14048_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14048_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-all:
    - bat-ptl-vm:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-ptl-vm/igt@xe_pat@pat-index-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-ptl-vm/igt@xe_pat@pat-index-all.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14048_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4543]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8622 -> IGTPW_14048

  IGTPW_14048: 14048
  IGT_8622: 8622
  xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0: 2395af7950abb996316c9ee00f68a639fb6eb1c0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/index.html

--===============1494556851982749732==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: add helper funtion to read PAT table</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157481/">https://patchwork.freedesktop.org/series/157481/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8622_BAT -&gt; XEIGTPW_14048_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14048_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14048_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14048_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-ptl-vm/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-ptl-vm/igt@xe_pat@pat-index-all.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14048_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8622/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14048/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8622 -&gt; IGTPW_14048</li>
</ul>
<p>IGTPW_14048: 14048<br />
  IGT_8622: 8622<br />
  xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0: 2395af7950abb996316c9ee00f68a639fb6eb1c0</p>

</body>
</html>

--===============1494556851982749732==--
