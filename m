Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A18C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 19:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1C110E1C7;
	Tue, 26 Mar 2024 19:07:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466CD10E002;
 Tue, 26 Mar 2024 19:07:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1484190867571339446=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/pci=3A_Add_new_and_missing?=
 =?utf-8?q?_PCI_IDs_to_DG2_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 19:07:46 -0000
Message-ID: <171148006628.1053735.3599227526100979762@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
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

--===============1484190867571339446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pci: Add new and missing PCI IDs to DG2 platform
URL   : https://patchwork.freedesktop.org/series/131633/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7785_BAT -> XEIGTPW_10918_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  Additional (1): bat-lnl-1 
  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10918_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1] +19 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10918/bat-lnl-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7785 -> IGTPW_10918

  IGTPW_10918: 10918
  IGT_7785: 7785
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10918/index.html

--===============1484190867571339446==
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
<tr><td><b>Series:</b></td><td>lib/pci: Add new and missing PCI IDs to DG2 platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131633/">https://patchwork.freedesktop.org/series/131633/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10918/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10918/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7785_BAT -&gt; XEIGTPW_10918_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>Additional (1): bat-lnl-1 <br />
  Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10918_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small-multi-vm:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10918/bat-lnl-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7785 -&gt; IGTPW_10918</li>
</ul>
<p>IGTPW_10918: 10918<br />
  IGT_7785: 7785<br />
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c</p>

</body>
</html>

--===============1484190867571339446==--
