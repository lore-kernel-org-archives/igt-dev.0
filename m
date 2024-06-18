Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42697C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 18:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD15C10E0D5;
	Tue, 18 Jun 2024 18:18:43 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108C10E0D5;
 Tue, 18 Jun 2024 18:18:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4199464161021582506=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fstore?=
 =?utf-8?q?=3A_Add_basic=5Finst=5Fbenchmark?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jun 2024 18:18:41 -0000
Message-ID: <171873472198.104452.12368153271527389632@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618172021.13007-1-nirmoy.das@intel.com>
In-Reply-To: <20240618172021.13007-1-nirmoy.das@intel.com>
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

--===============4199464161021582506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_store: Add basic_inst_benchmark
URL   : https://patchwork.freedesktop.org/series/135027/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7891_BAT -> XEIGTPW_11274_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11274_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11274_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11274_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_store@basic-store:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-pvc-2/igt@xe_exec_store@basic-store.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-pvc-2/igt@xe_exec_store@basic-store.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-dg2-oem2/igt@xe_exec_store@basic-store.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-dg2-oem2/igt@xe_exec_store@basic-store.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-atsm-2/igt@xe_exec_store@basic-store.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-atsm-2/igt@xe_exec_store@basic-store.html

  


Build changes
-------------

  * IGT: IGT_7891 -> IGTPW_11274
  * Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -> xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c

  IGTPW_11274: 11274
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34
  xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c: fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/index.html

--===============4199464161021582506==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_store: Add basic_inst_benchmark</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135027/">https://patchwork.freedesktop.org/series/135027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7891_BAT -&gt; XEIGTPW_11274_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11274_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11274_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11274_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_store@basic-store:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-pvc-2/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-pvc-2/igt@xe_exec_store@basic-store.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-dg2-oem2/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-dg2-oem2/igt@xe_exec_store@basic-store.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/bat-atsm-2/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11274/bat-atsm-2/igt@xe_exec_store@basic-store.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7891 -&gt; IGTPW_11274</li>
<li>Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -&gt; xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c</li>
</ul>
<p>IGTPW_11274: 11274<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34<br />
  xe-1491-fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c: fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c</p>

</body>
</html>

--===============4199464161021582506==--
