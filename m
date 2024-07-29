Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD9DC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 05:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3B110E2F2;
	Mon, 29 Jul 2024 05:15:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DAF10E2F2;
 Mon, 29 Jul 2024 05:15:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0703374206400258899=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fpm=5Frps?=
 =?utf-8?q?=3A_Disable_threshold_subtests_when_SLPC_is_enabled_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 05:15:20 -0000
Message-ID: <172223012015.406340.10499380165945789015@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726080259.106611-1-sk.anirban@intel.com>
In-Reply-To: <20240726080259.106611-1-sk.anirban@intel.com>
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

--===============0703374206400258899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_pm_rps: Disable threshold subtests when SLPC is enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/136551/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15142 -> IGTPW_11480
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/index.html

Participating hosts (41 -> 35)
------------------------------

  Additional (1): fi-elk-e7500 
  Missing    (7): bat-dg1-7 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-arls-2 bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11480 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [PASS][1] -> [FAIL][2] ([i915#10378])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15142/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - bat-dg2-13:         [PASS][3] -> [SKIP][4] ([Intel XE#484]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15142/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][5] +24 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7940 -> IGTPW_11480

  CI-20190529: 20190529
  CI_DRM_15142: e948842a6cba538c9f5f5dc8535a88d82a3fc0fe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11480: 11480
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/index.html

--===============0703374206400258899==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_pm_rps: Disable threshold subtests when SLPC is enabled (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136551/">https://patchwork.freedesktop.org/series/136551/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15142 -&gt; IGTPW_11480</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/index.html</p>
<h2>Participating hosts (41 -&gt; 35)</h2>
<p>Additional (1): fi-elk-e7500 <br />
  Missing    (7): bat-dg1-7 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-arls-2 bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11480 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15142/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15142/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11480/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7940 -&gt; IGTPW_11480</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15142: e948842a6cba538c9f5f5dc8535a88d82a3fc0fe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11480: 11480<br />
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0703374206400258899==--
