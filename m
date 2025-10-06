Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790AACCA470
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 20:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0DF10E461;
	Mon,  6 Oct 2025 20:16:41 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3510E45F;
 Mon,  6 Oct 2025 20:16:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2054186019353518542=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms=5Fmax=5Flink=5Fbpc=3A?=
 =?utf-8?q?_Add_=27link_bpc=27_DRM_connector_property?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marius Vlad" <marius.vlad@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 06 Oct 2025 20:16:40 -0000
Message-ID: <175978180001.7930.16406840953395006227@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006080705.2869-1-marius.vlad@collabora.com>
In-Reply-To: <20251006080705.2869-1-marius.vlad@collabora.com>
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

--===============2054186019353518542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_max_link_bpc: Add 'link bpc' DRM connector property
URL   : https://patchwork.freedesktop.org/series/155438/
State : success

== Summary ==

CI Bug Log - changes from IGT_8575 -> IGTPW_13863
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13863 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/fi-kbl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][2] -> [DMESG-FAIL][3] ([i915#12061]) +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][4] ([i915#12061]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@vgem_basic@unload:
    - fi-kbl-guc:         [INCOMPLETE][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/fi-kbl-guc/igt@vgem_basic@unload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/fi-kbl-guc/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][8] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][9] ([i915#12061] / [i915#13929])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-atsm-1/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][10] ([i915#14204]) -> [DMESG-FAIL][11] ([i915#13929])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-atsm-1/igt@i915_selftest@live@mman.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8575 -> IGTPW_13863
  * Linux: CI_DRM_17313 -> CI_DRM_17316

  CI-20190529: 20190529
  CI_DRM_17313: 5d520fdf951167ca881c7ebf831dedff629e6ccf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17316: d24790b7ef66a02d3ae6409d22dd98cb0756fbd2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13863: 9510aab48e6cc7a35e859cafb6a88793a2461603 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/index.html

--===============2054186019353518542==
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
<tr><td><b>Series:</b></td><td>kms_max_link_bpc: Add &#x27;link bpc&#x27; DRM connector property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155438/">https://patchwork.freedesktop.org/series/155438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8575 -&gt; IGTPW_13863</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13863 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/fi-kbl-guc/igt@vgem_basic@unload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/fi-kbl-guc/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8575/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13863/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8575 -&gt; IGTPW_13863</li>
<li>Linux: CI_DRM_17313 -&gt; CI_DRM_17316</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17313: 5d520fdf951167ca881c7ebf831dedff629e6ccf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17316: d24790b7ef66a02d3ae6409d22dd98cb0756fbd2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13863: 9510aab48e6cc7a35e859cafb6a88793a2461603 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2054186019353518542==--
