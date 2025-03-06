Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769CCC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 04:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1AF10E0C5;
	Thu,  6 Mar 2025 04:47:22 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E4610E0C5;
 Thu,  6 Mar 2025 04:47:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3857313034923266565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Stress_copy_engines_durin?=
 =?utf-8?q?g_render_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Mar 2025 04:47:20 -0000
Message-ID: <174123644098.65601.7305005508472274278@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250305090743.16894-1-francois.dugast@intel.com>
In-Reply-To: <20250305090743.16894-1-francois.dugast@intel.com>
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

--===============3857313034923266565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stress copy engines during render (rev2)
URL   : https://patchwork.freedesktop.org/series/145831/
State : success

== Summary ==

CI Bug Log - changes from IGT_8262 -> IGTPW_12708
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): bat-arlh-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12708 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][3] -> [DMESG-WARN][4] ([i915#13494])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-mtlp-9/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-adlp-9:         NOTRUN -> [INCOMPLETE][5] ([i915#9413])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [INCOMPLETE][8] ([i915#12904]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-arlh-3:         [INCOMPLETE][10] ([i915#12445]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [ABORT][12] ([i915#13696]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-FAIL][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][16] ([i915#12445]) -> [DMESG-FAIL][17] ([i915#12061])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arlh-3/igt@i915_selftest@live.html
    - bat-adlp-9:         [ABORT][18] ([i915#13696]) -> [INCOMPLETE][19] ([i915#9413])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8262 -> IGTPW_12708

  CI-20190529: 20190529
  CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12708: 12708
  IGT_8262: 8262

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/index.html

--===============3857313034923266565==
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
<tr><td><b>Series:</b></td><td>Stress copy engines during render (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145831/">https://patchwork.freedesktop.org/series/145831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8262 -&gt; IGTPW_12708</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/index.html</p>
<h2>Participating hosts (46 -&gt; 44)</h2>
<p>Missing    (2): bat-arlh-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12708 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12708/bat-adlp-9/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8262 -&gt; IGTPW_12708</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12708: 12708<br />
  IGT_8262: 8262</p>

</body>
</html>

--===============3857313034923266565==--
