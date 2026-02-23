Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F06E98DEC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 06:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2851610E23D;
	Mon, 23 Feb 2026 06:12:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628310E23D;
 Mon, 23 Feb 2026 06:12:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4199396152004088078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fpat=3A_use_ke?=
 =?utf-8?q?rnel_debugfs_as_authoritative_PAT_source_for_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Feb 2026 06:12:47 -0000
Message-ID: <177182716726.273880.5727181648322673055@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223040137.19588-1-himanshu.girotra@intel.com>
In-Reply-To: <20260223040137.19588-1-himanshu.girotra@intel.com>
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

--===============4199396152004088078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe
URL   : https://patchwork.freedesktop.org/series/161927/
State : success

== Summary ==

CI Bug Log - changes from IGT_8765 -> IGTPW_14590
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14590 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - fi-hsw-4770:        [SKIP][3] ([i915#1849] / [i915#2582]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [SKIP][5] ([i915#2582]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@gem_softpin@safe-alignment:
    - fi-hsw-4770:        [FAIL][7] ([i915#15527]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@gem_softpin@safe-alignment.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@gem_softpin@safe-alignment.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8765 -> IGTPW_14590
  * Linux: CI_DRM_18016 -> CI_DRM_18018

  CI-20190529: 20190529
  CI_DRM_18016: f8bde45966c329f3025862c5fc462e4b13f52ca8 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18018: 05fc8dd26df5c1cae18b1d5b9de791a9a332433c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14590: cdb057207415a9cb5299e51b201d97b86700ef7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8765: 8765

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/index.html

--===============4199396152004088078==
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
<tr><td><b>Series:</b></td><td>lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161927/">https://patchwork.freedesktop.org/series/161927/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8765 -&gt; IGTPW_14590</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14590 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@safe-alignment:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8765/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527">i915#15527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14590/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8765 -&gt; IGTPW_14590</li>
<li>Linux: CI_DRM_18016 -&gt; CI_DRM_18018</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18016: f8bde45966c329f3025862c5fc462e4b13f52ca8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18018: 05fc8dd26df5c1cae18b1d5b9de791a9a332433c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14590: cdb057207415a9cb5299e51b201d97b86700ef7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8765: 8765</p>

</body>
</html>

--===============4199396152004088078==--
