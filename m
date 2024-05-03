Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD845C25B4F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 10:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE1F10FA4C;
	Fri,  3 May 2024 10:17:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D4D10F886;
 Fri,  3 May 2024 10:17:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4178395491282095594=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Add_amd=5Freplay_IGT_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 May 2024 10:17:04 -0000
Message-ID: <171473142468.1887024.11435186005935119273@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503090854.13663-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240503090854.13663-1-chiahsuan.chung@amd.com>
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

--===============4178395491282095594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Add amd_replay IGT test
URL   : https://patchwork.freedesktop.org/series/133166/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14704 -> IGTPW_11093
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/index.html

Participating hosts (40 -> 34)
------------------------------

  Missing    (6): fi-kbl-7567u fi-apl-guc fi-snb-2520m fi-kbl-8809g bat-dg2-13 bat-dg2-11 

Known issues
------------

  Here are the changes found in IGTPW_11093 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - bat-adls-6:         [TIMEOUT][2] ([i915#10026]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14704/bat-adls-6/igt@i915_selftest@live@execlists.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/bat-adls-6/igt@i915_selftest@live@execlists.html

  
  [i915#10026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10026
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7830 -> IGTPW_11093

  CI-20190529: 20190529
  CI_DRM_14704: 9e0d20a3c9ad007041b11b394b9b6a78008cf29c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11093: 8fb5b3dd799e85414392f531f59c5ec5e8bc2cdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7830: 7830

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/index.html

--===============4178395491282095594==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Add amd_replay IGT test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133166/">https://patchwork.freedesktop.org/series/133166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14704 -&gt; IGTPW_11093</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/index.html</p>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): fi-kbl-7567u fi-apl-guc fi-snb-2520m fi-kbl-8809g bat-dg2-13 bat-dg2-11 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11093 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@parallel-random-engines:<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14704/bat-adls-6/igt@i915_selftest@live@execlists.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10026">i915#10026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11093/bat-adls-6/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7830 -&gt; IGTPW_11093</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14704: 9e0d20a3c9ad007041b11b394b9b6a78008cf29c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11093: 8fb5b3dd799e85414392f531f59c5ec5e8bc2cdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7830: 7830</p>

</body>
</html>

--===============4178395491282095594==--
