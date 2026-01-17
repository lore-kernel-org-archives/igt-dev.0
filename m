Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A024C98312
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 08:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ED010E048;
	Sat, 17 Jan 2026 08:31:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39F10E027;
 Sat, 17 Jan 2026 08:31:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9142684235290315466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fdevice=5Finfo?=
 =?utf-8?q?=3A_get_the_xe_=2Egraphics=5Frel_from_GMD=5FID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jan 2026 08:31:58 -0000
Message-ID: <176863871817.164555.11994041900018051331@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260117071459.892532-1-x.wang@intel.com>
In-Reply-To: <20260117071459.892532-1-x.wang@intel.com>
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

--===============9142684235290315466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_device_info: get the xe .graphics_rel from GMD_ID
URL   : https://patchwork.freedesktop.org/series/160230/
State : success

== Summary ==

CI Bug Log - changes from IGT_8704 -> IGTPW_14361
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14361 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - bat-twl-1:          NOTRUN -> [SKIP][1] ([i915#15249])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][2] -> [DMESG-FAIL][3] ([i915#12061]) +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-mtlp-8/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-dg2-9:          [PASS][4] -> [ABORT][5] ([i915#15526]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-dg2-9/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-dg2-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [ABORT][8] ([i915#14365]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-twl-1/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-twl-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#14365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365
  [i915#15249]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249
  [i915#15526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15526


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8704 -> IGTPW_14361
  * Linux: CI_DRM_17821 -> CI_DRM_17837

  CI-20190529: 20190529
  CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17837: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14361: 14361
  IGT_8704: 8704

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/index.html

--===============9142684235290315466==
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
<tr><td><b>Series:</b></td><td>lib/intel_device_info: get the xe .graphics_rel from GMD_ID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160230/">https://patchwork.freedesktop.org/series/160230/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8704 -&gt; IGTPW_14361</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14361 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15249">i915#15249</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-dg2-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-dg2-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15526">i915#15526</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8704/bat-twl-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365">i915#14365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14361/bat-twl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8704 -&gt; IGTPW_14361</li>
<li>Linux: CI_DRM_17821 -&gt; CI_DRM_17837</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17837: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14361: 14361<br />
  IGT_8704: 8704</p>

</body>
</html>

--===============9142684235290315466==--
