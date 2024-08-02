Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34987C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 10:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAEC10E9D2;
	Fri,  2 Aug 2024 10:00:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7A810E9D2;
 Fri,  2 Aug 2024 10:00:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1863336637497302326=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel=3A_Drop_unused_?=
 =?utf-8?q?local_variables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Aug 2024 10:00:42 -0000
Message-ID: <172259284257.502880.8975348408218700232@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801225224.3744479-1-matthew.d.roper@intel.com>
In-Reply-To: <20240801225224.3744479-1-matthew.d.roper@intel.com>
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

--===============1863336637497302326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Drop unused local variables
URL   : https://patchwork.freedesktop.org/series/136819/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15170 -> IGTPW_11520
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/index.html

Participating hosts (42 -> 40)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (3): bat-kbl-2 fi-snb-2520m fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_11520 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2] ([i915#11349] / [i915#11378])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-jsl-1:          [PASS][3] -> [SKIP][4] ([i915#9688]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-jsl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-jsl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][5] ([i915#11781])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][6] ([i915#10378]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#11781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11781
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7951 -> IGTPW_11520

  CI-20190529: 20190529
  CI_DRM_15170: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11520: 11520
  IGT_7951: 7951

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/index.html

--===============1863336637497302326==
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
<tr><td><b>Series:</b></td><td>tests/intel: Drop unused local variables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136819/">https://patchwork.freedesktop.org/series/136819/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15170 -&gt; IGTPW_11520</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (3): bat-kbl-2 fi-snb-2520m fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11520 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move@edp-1:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-jsl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-jsl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11781">i915#11781</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_lmem_swapping@basic@lmem0:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11520/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7951 -&gt; IGTPW_11520</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15170: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11520: 11520<br />
  IGT_7951: 7951</p>

</body>
</html>

--===============1863336637497302326==--
