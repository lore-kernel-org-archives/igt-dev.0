Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C506C3ABB9
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 22:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D0D10E532;
	Mon,  5 May 2025 22:45:59 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB110E52B;
 Mon,  5 May 2025 22:45:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0125380113226631775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fs?=
 =?utf-8?q?ystem=5Fallocator=3A_Check_huge_pages_free_in_thp_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 May 2025 22:45:58 -0000
Message-ID: <174648515859.46373.4503799775269706659@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505214152.315363-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250505214152.315363-1-jonathan.cavitt@intel.com>
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

--===============0125380113226631775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Check huge pages free in thp tests
URL   : https://patchwork.freedesktop.org/series/148613/
State : success

== Summary ==

CI Bug Log - changes from IGT_8354 -> IGTPW_13080
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13080 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@nb-await@vecs0:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@i915_selftest@live@active:
    - fi-bsw-nick:        [PASS][3] -> [DMESG-FAIL][4] ([i915#14045]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-bsw-nick/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-bsw-nick/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@gt_pm:
    - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#14046])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-cfl-guc:         [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - fi-cfl-guc:         [PASS][9] -> [FAIL][10] ([i915#14132])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-dg2-9:          [ABORT][11] ([i915#13465] / [i915#13571]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-mtlp-8/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-twl-2:          [INCOMPLETE][15] ([i915#14096]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [ABORT][19] ([i915#13723]) -> [INCOMPLETE][20] ([i915#14046])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][21] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][22] ([i915#12061] / [i915#14204])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-atsm-1/igt@i915_selftest@live.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][23] ([i915#13929]) -> [DMESG-FAIL][24] ([i915#14204])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-atsm-1/igt@i915_selftest@live@mman.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14045]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14045
  [i915#14046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046
  [i915#14096]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096
  [i915#14132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14132
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8354 -> IGTPW_13080
  * Linux: CI_DRM_16501 -> CI_DRM_16503

  CI-20190529: 20190529
  CI_DRM_16501: 4bc96b6ef5bd34903a5170366644121777aa2418 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16503: 47bf2b0a07ce766d4e893762e02be4a2646e0179 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13080: ef335949b5474f63a830f6b9ab45bd5b6df89dd5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/index.html

--===============0125380113226631775==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Check huge pages free in thp tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148613/">https://patchwork.freedesktop.org/series/148613/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8354 -&gt; IGTPW_13080</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13080 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-bsw-nick/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-bsw-nick/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14045">i915#14045</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046">i915#14046</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14132">i915#14132</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465">i915#13465</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i915#14096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046">i915#14046</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8354/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13080/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8354 -&gt; IGTPW_13080</li>
<li>Linux: CI_DRM_16501 -&gt; CI_DRM_16503</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16501: 4bc96b6ef5bd34903a5170366644121777aa2418 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16503: 47bf2b0a07ce766d4e893762e02be4a2646e0179 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13080: ef335949b5474f63a830f6b9ab45bd5b6df89dd5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0125380113226631775==--
