Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4755C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6F710E561;
	Mon,  2 Jun 2025 15:43:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9CF10E558;
 Mon,  2 Jun 2025 15:43:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4775393818081036300=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fpm=3A_Test?=
 =?utf-8?q?_to_validate_vram-sr_through_Mods_during_host_s2idle?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Jun 2025 15:43:47 -0000
Message-ID: <174887902757.41082.17842886806891022587@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602110300.1324145-1-soham.purkait@intel.com>
In-Reply-To: <20250602110300.1324145-1-soham.purkait@intel.com>
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

--===============4775393818081036300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm: Test to validate vram-sr through Mods during host s2idle
URL   : https://patchwork.freedesktop.org/series/149731/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8388_BAT -> XEIGTPW_13224_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13224_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13224_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13224_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8388/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13224_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-lnl-2:          [PASS][3] -> [ABORT][4] ([Intel XE#5003])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8388/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
  [Intel XE#5003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003


Build changes
-------------

  * IGT: IGT_8388 -> IGTPW_13224
  * Linux: xe-3167-52afe38ad6f8eccc238956b78e04977dded23411 -> xe-3175-747ae64da5dbe4ead9e1cf8790385fa387900ec6

  IGTPW_13224: 13224
  IGT_8388: 8388
  xe-3167-52afe38ad6f8eccc238956b78e04977dded23411: 52afe38ad6f8eccc238956b78e04977dded23411
  xe-3175-747ae64da5dbe4ead9e1cf8790385fa387900ec6: 747ae64da5dbe4ead9e1cf8790385fa387900ec6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/index.html

--===============4775393818081036300==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm: Test to validate vram-sr through Mods during host s2idle</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149731/">https://patchwork.freedesktop.org/series/149731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8388_BAT -&gt; XEIGTPW_13224_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13224_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13224_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13224_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8388/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13224_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8388/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13224/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003">Intel XE#5003</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8388 -&gt; IGTPW_13224</li>
<li>Linux: xe-3167-52afe38ad6f8eccc238956b78e04977dded23411 -&gt; xe-3175-747ae64da5dbe4ead9e1cf8790385fa387900ec6</li>
</ul>
<p>IGTPW_13224: 13224<br />
  IGT_8388: 8388<br />
  xe-3167-52afe38ad6f8eccc238956b78e04977dded23411: 52afe38ad6f8eccc238956b78e04977dded23411<br />
  xe-3175-747ae64da5dbe4ead9e1cf8790385fa387900ec6: 747ae64da5dbe4ead9e1cf8790385fa387900ec6</p>

</body>
</html>

--===============4775393818081036300==--
