Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33744C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 19:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47610E1BF;
	Wed,  4 Jun 2025 19:49:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2410E1BF;
 Wed,  4 Jun 2025 19:49:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3523710683393835886=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Extend_IGT_to_support_And?=
 =?utf-8?q?roid_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevaka Prabu Badrappan" <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Jun 2025 19:49:26 -0000
Message-ID: <174906656670.49379.4546252429187994883@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

--===============3523710683393835886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend IGT to support Android (rev15)
URL   : https://patchwork.freedesktop.org/series/148432/
State : success

== Summary ==

CI Bug Log - changes from IGT_8396 -> IGTPW_13244
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13244 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - bat-twl-2:          [PASS][1] -> [ABORT][2] ([i915#14357]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-twl-2/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-twl-2/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_dsc@dsc-basic:
    - bat-apl-1:          NOTRUN -> [SKIP][5] +22 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-apl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-cfl-guc:         [PASS][6] -> [SKIP][7] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - fi-cfl-guc:         [PASS][8] -> [FAIL][9] ([i915#14317])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][10] ([i915#12061]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][12] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][13] ([i915#12061] / [i915#14204])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-atsm-1/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][14] ([i915#13929]) -> [DMESG-FAIL][15] ([i915#14204])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-atsm-1/igt@i915_selftest@live@mman.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@intel_hwmon@hwmon-read:
    - bat-apl-1:          [ABORT][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-apl-1/igt@intel_hwmon@hwmon-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-apl-1/igt@intel_hwmon@hwmon-read.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14317]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14317
  [i915#14357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8396 -> IGTPW_13244

  CI-20190529: 20190529
  CI_DRM_16645: 573b98ac3ff9ff95c3316789e97980277e4ffe2b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13244: 522d6bb8e1da9cc508103a5930e22949921ece2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8396: 8396

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html

--===============3523710683393835886==
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
<tr><td><b>Series:</b></td><td>Extend IGT to support Android (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148432/">https://patchwork.freedesktop.org/series/148432/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8396 -&gt; IGTPW_13244</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13244 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-twl-2/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-twl-2/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14357">i915#14357</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-apl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14317">i915#14317</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/bat-apl-1/igt@intel_hwmon@hwmon-read.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/bat-apl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8396 -&gt; IGTPW_13244</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16645: 573b98ac3ff9ff95c3316789e97980277e4ffe2b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13244: 522d6bb8e1da9cc508103a5930e22949921ece2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8396: 8396</p>

</body>
</html>

--===============3523710683393835886==--
