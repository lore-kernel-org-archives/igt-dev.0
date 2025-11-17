Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B1CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 17:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAAC10E04F;
	Mon, 17 Nov 2025 17:26:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A2B10E04F;
 Mon, 17 Nov 2025 17:26:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1590879711086164018=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Flmem=5F?=
 =?utf-8?q?swapping=3A_Run_smem-oom_helper_loop_in_background?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Nov 2025 17:26:34 -0000
Message-ID: <176340039465.2374.12052590913626075993@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117113032.1143849-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251117113032.1143849-2-janusz.krzysztofik@linux.intel.com>
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

--===============1590879711086164018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_lmem_swapping: Run smem-oom helper loop in background
URL   : https://patchwork.freedesktop.org/series/157662/
State : success

== Summary ==

CI Bug Log - changes from IGT_8628 -> IGTPW_14071
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html

Participating hosts (45 -> 44)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (2): bat-dg2-8 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14071 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] +22 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][4] ([i915#12061]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][6] ([i915#14867]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][8] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][9] ([i915#12061] / [i915#14204])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-atsm-1/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][10] ([i915#13929]) -> [DMESG-FAIL][11] ([i915#14204])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-atsm-1/igt@i915_selftest@live@mman.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8628 -> IGTPW_14071
  * Linux: CI_DRM_17557 -> CI_DRM_17559

  CI-20190529: 20190529
  CI_DRM_17557: b2e41c70a5eeddce427dc6df02508b6856eb4a11 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17559: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14071: 06dc61d54888a8b82292137d321e2657bdc4d11c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8628: 8628

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html

--===============1590879711086164018==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_lmem_swapping: Run smem-oom helper loop in background</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157662/">https://patchwork.freedesktop.org/series/157662/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8628 -&gt; IGTPW_14071</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (2): bat-dg2-8 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14071 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867">i915#14867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8628/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8628 -&gt; IGTPW_14071</li>
<li>Linux: CI_DRM_17557 -&gt; CI_DRM_17559</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17557: b2e41c70a5eeddce427dc6df02508b6856eb4a11 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17559: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14071: 06dc61d54888a8b82292137d321e2657bdc4d11c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8628: 8628</p>

</body>
</html>

--===============1590879711086164018==--
