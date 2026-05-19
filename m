Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A538CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 18:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BC710E197;
	Tue, 19 May 2026 18:04:02 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0078210E197;
 Tue, 19 May 2026 18:03:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6743894639042996452=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fsetmode=3A_Add_?=
 =?utf-8?q?HDMI_2=2E0_clock_limit_for_mode_selection_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 18:03:43 -0000
Message-ID: <177921382399.86973.1754186941269806970@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519041750.1199802-1-jeevan.b@intel.com>
In-Reply-To: <20260519041750.1199802-1-jeevan.b@intel.com>
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

--===============6743894639042996452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)
URL   : https://patchwork.freedesktop.org/series/160881/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8921_BAT -> XEIGTPW_15202_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15202_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15202_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15202_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_range_idle:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html

  


Build changes
-------------

  * IGT: IGT_8921 -> IGTPW_15202
  * Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -> xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d

  IGTPW_15202: 15202
  IGT_8921: 8921
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497
  xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d: f32ba7e949b0579eee118f06312945e34ce6628d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html

--===============6743894639042996452==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160881/">https://patchwork.freedesktop.org/series/160881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8921_BAT -&gt; XEIGTPW_15202_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15202_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15202_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15202_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15202/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGTPW_15202</li>
<li>Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -&gt; xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d</li>
</ul>
<p>IGTPW_15202: 15202<br />
  IGT_8921: 8921<br />
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497<br />
  xe-5097-f32ba7e949b0579eee118f06312945e34ce6628d: f32ba7e949b0579eee118f06312945e34ce6628d</p>

</body>
</html>

--===============6743894639042996452==--
