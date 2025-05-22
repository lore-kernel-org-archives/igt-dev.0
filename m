Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C8C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 16:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51710E133;
	Thu, 22 May 2025 16:47:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86BE10E133;
 Thu, 22 May 2025 16:47:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4205178585869681354=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Extend_IGT_to_support_And?=
 =?utf-8?q?roid_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevaka Prabu Badrappan" <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 May 2025 16:47:32 -0000
Message-ID: <174793245274.14490.6107254466080736731@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
In-Reply-To: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
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

--===============4205178585869681354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend IGT to support Android (rev10)
URL   : https://patchwork.freedesktop.org/series/148432/
State : success

== Summary ==

CI Bug Log - changes from IGT_8375 -> IGTPW_13171
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-ilk-650 fi-rkl-11600 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13171 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][1] -> [ABORT][2] ([i915#13696])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-8/igt@i915_selftest@live.html
    - bat-arlh-3:         [PASS][3] -> [DMESG-FAIL][4] ([i915#14243]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-dg2-8:          [PASS][5] -> [ABORT][6] ([i915#14201])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-8/igt@i915_selftest@live@guc_multi_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-8/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [ABORT][11] ([i915#13571]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arlh-2:         [ABORT][13] ([i915#13723]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-arlh-2/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][15] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][16] ([i915#12061] / [i915#14204])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-atsm-1/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][17] ([i915#13929]) -> [DMESG-FAIL][18] ([i915#14204])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-atsm-1/igt@i915_selftest@live@mman.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8375 -> IGTPW_13171
  * Linux: CI_DRM_16582 -> CI_DRM_16584

  CI-20190529: 20190529
  CI_DRM_16582: 444fd022f6c4f5245b1e8f797805ab3917235d3d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16584: 3f677cc94262c39d180401938c3a0e4ec33472f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13171: 604f6169d3678fccc630c0781d42390e3e7ccd44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8375: 8375

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/index.html

--===============4205178585869681354==
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
<tr><td><b>Series:</b></td><td>Extend IGT to support Android (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148432/">https://patchwork.freedesktop.org/series/148432/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8375 -&gt; IGTPW_13171</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Missing    (3): fi-ilk-650 fi-rkl-11600 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13171 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-8/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-8/igt@i915_selftest@live@guc_multi_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13171/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8375 -&gt; IGTPW_13171</li>
<li>Linux: CI_DRM_16582 -&gt; CI_DRM_16584</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16582: 444fd022f6c4f5245b1e8f797805ab3917235d3d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16584: 3f677cc94262c39d180401938c3a0e4ec33472f3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13171: 604f6169d3678fccc630c0781d42390e3e7ccd44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8375: 8375</p>

</body>
</html>

--===============4205178585869681354==--
