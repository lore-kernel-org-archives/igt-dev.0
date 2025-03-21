Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D17C36002
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 21:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504610E050;
	Fri, 21 Mar 2025 21:15:14 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3A010E050;
 Fri, 21 Mar 2025 21:15:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6951361973385773018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_log_information_to_dc5_psr_test_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Mar 2025 21:15:13 -0000
Message-ID: <174259171345.65892.6691119211763893123@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250226065202.84015-1-mohammed.thasleem@intel.com>
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

--===============6951361973385773018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add log information to dc5 psr test (rev6)
URL   : https://patchwork.freedesktop.org/series/145456/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8278_BAT -> XEIGTPW_12814_BAT
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

  Here are the changes found in XEIGTPW_12814_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8278/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12814/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8278 -> IGTPW_12814
  * Linux: xe-2833-74f632d1bd3b90ed79883361ca25f1225c0aee58 -> xe-2834-a123616cf3afc205116835d8b083f48272583dcd

  IGTPW_12814: 12814
  IGT_8278: b6673db372bd8987f65948d3a97f8dcd2ef42b01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2833-74f632d1bd3b90ed79883361ca25f1225c0aee58: 74f632d1bd3b90ed79883361ca25f1225c0aee58
  xe-2834-a123616cf3afc205116835d8b083f48272583dcd: a123616cf3afc205116835d8b083f48272583dcd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12814/index.html

--===============6951361973385773018==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add log information to dc5 psr test (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145456/">https://patchwork.freedesktop.org/series/145456/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12814/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12814/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8278_BAT -&gt; XEIGTPW_12814_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12814_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8278/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12814/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8278 -&gt; IGTPW_12814</li>
<li>Linux: xe-2833-74f632d1bd3b90ed79883361ca25f1225c0aee58 -&gt; xe-2834-a123616cf3afc205116835d8b083f48272583dcd</li>
</ul>
<p>IGTPW_12814: 12814<br />
  IGT_8278: b6673db372bd8987f65948d3a97f8dcd2ef42b01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2833-74f632d1bd3b90ed79883361ca25f1225c0aee58: 74f632d1bd3b90ed79883361ca25f1225c0aee58<br />
  xe-2834-a123616cf3afc205116835d8b083f48272583dcd: a123616cf3afc205116835d8b083f48272583dcd</p>

</body>
</html>

--===============6951361973385773018==--
