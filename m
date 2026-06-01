Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C66DCD6E60
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 21:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B30E10E9B0;
	Mon,  1 Jun 2026 21:15:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8DB10E9AF;
 Mon,  1 Jun 2026 21:15:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4692678662510355281=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_test/intel/xe=5Fvm=3AAdd_?=
 =?utf-8?q?oversubscribe_concurrent_bind_stress_subtest_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Jun 2026 21:15:12 -0000
Message-ID: <178034851229.32261.512826601251352813@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601171848.10873-1-sobin.thomas@intel.com>
In-Reply-To: <20260601171848.10873-1-sobin.thomas@intel.com>
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

--===============4692678662510355281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/intel/xe_vm:Add oversubscribe concurrent bind stress subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/165481/
State : success

== Summary ==

CI Bug Log - changes from IGT_8944 -> IGTPW_15279
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15279 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-n3050:       [DMESG-WARN][1] ([i915#16057]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8944/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-6:         [DMESG-FAIL][3] ([i915#16304]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8944/bat-arls-6/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/bat-arls-6/igt@i915_selftest@live@hangcheck.html

  
  [i915#16057]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057
  [i915#16304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16304


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8944 -> IGTPW_15279

  CI-20190529: 20190529
  CI_DRM_18599: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15279: 6f03be933ec6e8fd1579b77a44b530094f07d9f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8944: 8944

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/index.html

--===============4692678662510355281==
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
<tr><td><b>Series:</b></td><td>test/intel/xe_vm:Add oversubscribe concurrent bind stress subtest (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165481/">https://patchwork.freedesktop.org/series/165481/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8944 -&gt; IGTPW_15279</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15279 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8944/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057">i915#16057</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8944/bat-arls-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16304">i915#16304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15279/bat-arls-6/igt@i915_selftest@live@hangcheck.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8944 -&gt; IGTPW_15279</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18599: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15279: 6f03be933ec6e8fd1579b77a44b530094f07d9f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8944: 8944</p>

</body>
</html>

--===============4692678662510355281==--
