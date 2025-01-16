Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72799C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 11:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CCA10E947;
	Thu, 16 Jan 2025 11:06:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73CF10E144;
 Thu, 16 Jan 2025 11:06:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7731855493631935496=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=3A_Add_xe=5Fcg?=
 =?utf-8?q?=5Fdmem_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jan 2025 11:06:30 -0000
Message-ID: <173702559074.231007.1904380355365184311@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115115512.84520-1-dev@lankhorst.se>
In-Reply-To: <20250115115512.84520-1-dev@lankhorst.se>
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

--===============7731855493631935496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add xe_cg_dmem test
URL   : https://patchwork.freedesktop.org/series/143593/
State : success

== Summary ==

CI Bug Log - changes from IGT_8193 -> IGTPW_12447
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12447 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][1] ([i915#13350])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-mtlp-8:         [INCOMPLETE][2] ([i915#13495]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][4] ([i915#13393]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [DMESG-FAIL][6] ([i915#13393]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  [i915#13350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13350
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#13495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13495


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8193 -> IGTPW_12447

  CI-20190529: 20190529
  CI_DRM_15964: 4cea1f90028925afcf1a0f8a0ef301f90349688c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12447: 4593317dedb4854dc0f4d7beed6cf9c68f3adeb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/index.html

--===============7731855493631935496==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add xe_cg_dmem test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143593/">https://patchwork.freedesktop.org/series/143593/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8193 -&gt; IGTPW_12447</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12447 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13350">i915#13350</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13495">i915#13495</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8193/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12447/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8193 -&gt; IGTPW_12447</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15964: 4cea1f90028925afcf1a0f8a0ef301f90349688c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12447: 4593317dedb4854dc0f4d7beed6cf9c68f3adeb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7731855493631935496==--
