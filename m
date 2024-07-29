Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B791C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 23:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFCE10E48F;
	Mon, 29 Jul 2024 23:29:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441EC10E0E6;
 Mon, 29 Jul 2024 23:29:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3770895653360914510=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fsto?=
 =?utf-8?q?re=3A_Modify_test_for_Priority_Mem_Read_feature_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 23:29:35 -0000
Message-ID: <172229577527.426365.10017363053982328013@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729222434.1643521-1-pallavi.mishra@intel.com>
In-Reply-To: <20240729222434.1643521-1-pallavi.mishra@intel.com>
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

--===============3770895653360914510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_store: Modify test for Priority Mem Read feature (rev2)
URL   : https://patchwork.freedesktop.org/series/136457/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15151 -> IGTPW_11489
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11489 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11489, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (2): fi-tgl-1115g4 fi-elk-e7500 
  Missing    (2): fi-snb-2520m fi-kbl-8809g 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11489:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-elk-e7500:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/fi-elk-e7500/igt@runner@aborted.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/fi-tgl-1115g4/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@basic:
    - {bat-arlh-3}:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-arlh-3/igt@gem_exec_parallel@engines@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-arlh-3/igt@gem_exec_parallel@engines@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_11489 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-11:         [PASS][5] -> [FAIL][6] ([i915#10378])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][7] -> [DMESG-WARN][8] ([i915#11349] / [i915#11378])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [INCOMPLETE][9] ([i915#9413]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7942 -> IGTPW_11489

  CI-20190529: 20190529
  CI_DRM_15151: b6f9528c7fffc2f65c8e4969d35d9346fd503c9b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11489: 11489
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/index.html

--===============3770895653360914510==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_store: Modify test for Priority Mem Read feature (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136457/">https://patchwork.freedesktop.org/series/136457/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15151 -&gt; IGTPW_11489</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11489 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11489, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (2): fi-tgl-1115g4 fi-elk-e7500 <br />
  Missing    (2): fi-snb-2520m fi-kbl-8809g </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11489:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/fi-elk-e7500/igt@runner@aborted.html">FAIL</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_parallel@engines@basic:<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-arlh-3/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-arlh-3/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11489 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11489/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7942 -&gt; IGTPW_11489</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15151: b6f9528c7fffc2f65c8e4969d35d9346fd503c9b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11489: 11489<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3770895653360914510==--
