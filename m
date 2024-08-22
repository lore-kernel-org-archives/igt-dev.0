Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF7CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 07:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAAE10E7CA;
	Thu, 22 Aug 2024 07:25:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB9010E7CA;
 Thu, 22 Aug 2024 07:25:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7322252513196405816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Improve_MST_HDCP_tests_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Aug 2024 07:25:47 -0000
Message-ID: <172431154724.723840.14053651916737997220@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822061150.4127413-1-suraj.kandpal@intel.com>
In-Reply-To: <20240822061150.4127413-1-suraj.kandpal@intel.com>
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

--===============7322252513196405816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve MST HDCP tests (rev3)
URL   : https://patchwork.freedesktop.org/series/137215/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15275 -> IGTPW_11615
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (2): fi-snb-2520m fi-kbl-8809g 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11615:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@gem_contexts:
    - {bat-arlh-3}:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_11615 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_module_load@load:
    - fi-kbl-7567u:       [PASS][5] -> [DMESG-WARN][6] ([i915#180] / [i915#9925])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#180] / [i915#1982] / [i915#9925]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [PASS][9] -> [DMESG-WARN][10] ([i915#11621] / [i915#180] / [i915#1982] / [i915#9925])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][11] -> [DMESG-WARN][12] ([i915#11349])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arls-2/igt@i915_selftest@live@hangcheck.html
    - bat-mtlp-8:         [PASS][13] -> [DMESG-WARN][14] ([i915#11349])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
    - bat-arls-1:         [PASS][15] -> [DMESG-WARN][16] ([i915#11349])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][17] -> [DMESG-WARN][18] ([i915#11621]) +80 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [PASS][19] -> [DMESG-WARN][20] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][21] +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][22] -> [DMESG-WARN][23] ([i915#11621] / [i915#180] / [i915#9925]) +36 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7983 -> IGTPW_11615

  CI-20190529: 20190529
  CI_DRM_15275: 4c294bd7d8c84305dbb1de1aa9e010818e3f4b7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11615: eaa4e9bb9e0d400dc30a4a36ac80bd7e8d20ebf3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/index.html

--===============7322252513196405816==
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
<tr><td><b>Series:</b></td><td>Improve MST HDCP tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137215/">https://patchwork.freedesktop.org/series/137215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15275 -&gt; IGTPW_11615</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (2): fi-snb-2520m fi-kbl-8809g </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11615:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11615 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +80 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15275/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11615/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7983 -&gt; IGTPW_11615</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15275: 4c294bd7d8c84305dbb1de1aa9e010818e3f4b7e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11615: eaa4e9bb9e0d400dc30a4a36ac80bd7e8d20ebf3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7322252513196405816==--
