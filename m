Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF80C282C6
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 13:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C03310E5CD;
	Tue,  4 Mar 2025 13:41:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471610E5CB;
 Tue,  4 Mar 2025 13:41:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3945978418294620093=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_A?=
 =?utf-8?q?dd_function_engine_activity_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Mar 2025 13:41:44 -0000
Message-ID: <174109570407.619205.4451986952911106607@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304101019.3274493-1-riana.tauro@intel.com>
In-Reply-To: <20250304101019.3274493-1-riana.tauro@intel.com>
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

--===============3945978418294620093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Add function engine activity test
URL   : https://patchwork.freedesktop.org/series/145756/
State : success

== Summary ==

CI Bug Log - changes from IGT_8258 -> IGTPW_12695
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12695 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [ABORT][1] ([i915#13413])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live@mman.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][2] ([i915#12904]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-apl-1/igt@dmabuf@all-tests.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-adlp-6:         [ABORT][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-adlp-6/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-adlp-6/igt@i915_selftest@live.html
    - bat-twl-2:          [INCOMPLETE][6] ([i915#12445] / [i915#13761] / [i915#13776]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-twl-2/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc:
    - bat-adlp-6:         [ABORT][8] ([i915#13696]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-adlp-6/igt@i915_selftest@live@guc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-adlp-6/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [INCOMPLETE][10] ([i915#12445]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-atsm-1/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-twl-2:          [INCOMPLETE][12] ([i915#12445]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-twl-2/igt@i915_selftest@live@reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-twl-2/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [INCOMPLETE][14] ([i915#12445]) -> [ABORT][15] ([i915#13413])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-atsm-1/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13413
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#13761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13761
  [i915#13776]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13776


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8258 -> IGTPW_12695

  CI-20190529: 20190529
  CI_DRM_16220: 1cf56e26a93292ca26fbf891368b75a67e8700dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12695: 12695
  IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/index.html

--===============3945978418294620093==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Add function engine activity test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145756/">https://patchwork.freedesktop.org/series/145756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8258 -&gt; IGTPW_12695</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12695 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13413">i915#13413</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-adlp-6/igt@i915_selftest@live.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-adlp-6/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13761">i915#13761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13776">i915#13776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-twl-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-adlp-6/igt@i915_selftest@live@guc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-adlp-6/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-twl-2/igt@i915_selftest@live@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-twl-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8258/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12695/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13413">i915#13413</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8258 -&gt; IGTPW_12695</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16220: 1cf56e26a93292ca26fbf891368b75a67e8700dc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12695: 12695<br />
  IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3945978418294620093==--
