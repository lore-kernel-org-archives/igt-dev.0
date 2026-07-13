Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C5C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 12:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDA010E97F;
	Mon, 13 Jul 2026 12:25:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EA310E5CB;
 Mon, 13 Jul 2026 12:24:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6066520305386790109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_limiting_suspend_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jul 2026 12:24:32 -0000
Message-ID: <178394547222.183197.5717149435541865514@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713085515.463575-1-michal.grzelak@intel.com>
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
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

--===============6066520305386790109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: limiting suspend tests
URL   : https://patchwork.freedesktop.org/series/170301/
State : success

== Summary ==

CI Bug Log - changes from IGT_9004 -> IGTPW_15518
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15518 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +38 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9004/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#180]) +12 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9004/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9004 -> IGTPW_15518

  CI-20190529: 20190529
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15518: 15518
  IGT_9004: 9004

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/index.html

--===============6066520305386790109==
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
<tr><td><b>Series:</b></td><td>limiting suspend tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170301/">https://patchwork.freedesktop.org/series/170301/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9004 -&gt; IGTPW_15518</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15518 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9004/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9004/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15518/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9004 -&gt; IGTPW_15518</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15518: 15518<br />
  IGT_9004: 9004</p>

</body>
</html>

--===============6066520305386790109==--
