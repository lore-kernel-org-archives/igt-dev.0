Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D41CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 06:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268CF10E979;
	Thu,  4 Sep 2025 06:08:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8702810E97F;
 Thu,  4 Sep 2025 06:08:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0442162593415638956=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Optimise_crc_subtest_on_simulation_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Sep 2025 06:08:27 -0000
Message-ID: <175696610754.301896.15526315927530754830@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
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

--===============0442162593415638956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Optimise crc subtest on simulation platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/153481/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8521_BAT -> XEIGTPW_13690_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13690_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vm:        [SKIP][1] ([Intel XE#3342]) -> [SKIP][2] ([Intel XE#3342] / [Intel XE#5496])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13690/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#5496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5496
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8521 -> IGTPW_13690
  * Linux: xe-3672-09933716bb37eda75f5b3562a76e58a17c447647 -> xe-3674-b0ef84884a5d70694ee559a0156bbe094f62d30f

  IGTPW_13690: 13690
  IGT_8521: 8521
  xe-3672-09933716bb37eda75f5b3562a76e58a17c447647: 09933716bb37eda75f5b3562a76e58a17c447647
  xe-3674-b0ef84884a5d70694ee559a0156bbe094f62d30f: b0ef84884a5d70694ee559a0156bbe094f62d30f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13690/index.html

--===============0442162593415638956==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Optimise crc subtest on simulation platforms (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153481/">https://patchwork.freedesktop.org/series/153481/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13690/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13690/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8521_BAT -&gt; XEIGTPW_13690_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13690_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13690/bat-adlp-vm/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5496">Intel XE#5496</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8521 -&gt; IGTPW_13690</li>
<li>Linux: xe-3672-09933716bb37eda75f5b3562a76e58a17c447647 -&gt; xe-3674-b0ef84884a5d70694ee559a0156bbe094f62d30f</li>
</ul>
<p>IGTPW_13690: 13690<br />
  IGT_8521: 8521<br />
  xe-3672-09933716bb37eda75f5b3562a76e58a17c447647: 09933716bb37eda75f5b3562a76e58a17c447647<br />
  xe-3674-b0ef84884a5d70694ee559a0156bbe094f62d30f: b0ef84884a5d70694ee559a0156bbe094f62d30f</p>

</body>
</html>

--===============0442162593415638956==--
