Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CCD41C1F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 11:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B2610E0FA;
	Thu, 11 Dec 2025 11:35:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42010E070;
 Thu, 11 Dec 2025 11:35:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3924437833291952107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fallocator=3A_?=
 =?utf-8?q?Fix_Tile-4_format_tests_crash_by_initializing_maps_before_SysV_IP?=
 =?utf-8?q?C_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Dec 2025 11:35:34 -0000
Message-ID: <176545293436.76942.522146885377801607@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211095233.1172089-1-s.sebinraj@intel.com>
In-Reply-To: <20251211095233.1172089-1-s.sebinraj@intel.com>
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

--===============3924437833291952107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_allocator: Fix Tile-4 format tests crash by initializing maps before SysV IPC check
URL   : https://patchwork.freedesktop.org/series/158799/
State : success

== Summary ==

CI Bug Log - changes from IGT_8664 -> IGTPW_14192
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_14192 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-ivb-3770:        [PASS][1] -> [SKIP][2] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-ivb-3770/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/fi-ivb-3770/igt@fbdev@info.html

  * igt@fbdev@read:
    - fi-ivb-3770:        [PASS][3] -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-ivb-3770/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/fi-ivb-3770/igt@fbdev@read.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8664 -> IGTPW_14192
  * Linux: CI_DRM_17659 -> CI_DRM_17660

  CI-20190529: 20190529
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17660: fa2134b77403f66c13791a12274ab54fe17e1798 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14192: dde6c7de28ddfdacf650d302818552707d30eacf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/index.html

--===============3924437833291952107==
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
<tr><td><b>Series:</b></td><td>lib/intel_allocator: Fix Tile-4 format tests crash by initializing maps before SysV IPC check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158799/">https://patchwork.freedesktop.org/series/158799/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8664 -&gt; IGTPW_14192</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14192 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-ivb-3770/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/fi-ivb-3770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-ivb-3770/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/fi-ivb-3770/igt@fbdev@read.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14192/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8664 -&gt; IGTPW_14192</li>
<li>Linux: CI_DRM_17659 -&gt; CI_DRM_17660</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17660: fa2134b77403f66c13791a12274ab54fe17e1798 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14192: dde6c7de28ddfdacf650d302818552707d30eacf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3924437833291952107==--
