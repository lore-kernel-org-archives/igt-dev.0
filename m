Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E6CFB446
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 16:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99210E0CC;
	Mon,  7 Oct 2024 16:03:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E082210E0CC;
 Mon,  7 Oct 2024 16:03:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3414690652046545204=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fpm=5Fresid?=
 =?utf-8?q?ency=3A_Skip_on_igt=5Fpower=5Fopen_failure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Oct 2024 16:03:35 -0000
Message-ID: <172831701590.1199163.17960963865658271716@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
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

--===============3414690652046545204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Skip on igt_power_open failure (rev3)
URL   : https://patchwork.freedesktop.org/series/139352/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8054 -> IGTPW_11873
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11873 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11873, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): bat-rpls-4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11873:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-adlp-9:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-adlp-9/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-adlp-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@coherency:
    - bat-arls-1:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live@coherency.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live@coherency.html

  
Known issues
------------

  Here are the changes found in IGTPW_11873 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-1:         [PASS][5] -> [DMESG-FAIL][6] ([i915#10262] / [i915#10341] / [i915#12133])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@client:
    - bat-arls-1:         [PASS][7] -> [DMESG-FAIL][8] ([i915#10262]) +17 other tests dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live@client.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][9] -> [ABORT][10] ([i915#12216]) +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [DMESG-WARN][11] ([i915#10341] / [i915#12133]) -> [ABORT][12] ([i915#12061] / [i915#12133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-WARN][13] ([i915#10341] / [i915#11637]) -> [ABORT][14] ([i915#12061])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8054 -> IGTPW_11873
  * Linux: CI_DRM_15484 -> CI_DRM_15485

  CI-20190529: 20190529
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11873: c91cee7ae2b356f0f57de7212ae84a1eeaf9c96f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/index.html

--===============3414690652046545204==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Skip on igt_power_open failure (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139352/">https://patchwork.freedesktop.org/series/139352/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8054 -&gt; IGTPW_11873</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11873 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11873, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): bat-rpls-4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11873:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-adlp-9/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live@coherency.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11873 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-1/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-1/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) +17 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-5/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11873/bat-arls-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8054 -&gt; IGTPW_11873</li>
<li>Linux: CI_DRM_15484 -&gt; CI_DRM_15485</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11873: c91cee7ae2b356f0f57de7212ae84a1eeaf9c96f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3414690652046545204==--
