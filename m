Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D38C5B549
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 08:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDFF10E7EA;
	Fri, 30 May 2025 08:50:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C5910E7EA;
 Fri, 30 May 2025 08:50:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3606249180608841565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Refine_FBC_test_condition?=
 =?utf-8?q?s_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 May 2025 08:50:08 -0000
Message-ID: <174859500829.34133.14281412379663347166@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530075811.1033-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250530075811.1033-1-mohammed.thasleem@intel.com>
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

--===============3606249180608841565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refine FBC test conditions (rev3)
URL   : https://patchwork.freedesktop.org/series/149181/
State : success

== Summary ==

CI Bug Log - changes from IGT_8385 -> IGTPW_13217
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-glk-j4005 bat-arlh-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13217 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - bat-twl-2:          [PASS][1] -> [DMESG-WARN][2] ([i915#13736])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_hang:
    - bat-twl-2:          NOTRUN -> [INCOMPLETE][5] ([i915#14096])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live@guc_hang.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][6] ([i915#12904]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-apl-1/igt@dmabuf@all-tests.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][8] ([i915#13890]) -> [PASS][9] +78 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_engines:
    - bat-twl-2:          [INCOMPLETE][10] ([i915#14211]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_selftest@live@gt_engines.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live@gt_engines.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-twl-2:          [INCOMPLETE][12] ([i915#14211]) -> [INCOMPLETE][13] ([i915#14096])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][14] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][15] ([i915#12061] / [i915#13929])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-atsm-1/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][16] ([i915#14204]) -> [DMESG-FAIL][17] ([i915#13929])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-atsm-1/igt@i915_selftest@live@mman.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13736]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14096]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14211


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8385 -> IGTPW_13217

  CI-20190529: 20190529
  CI_DRM_16618: d94defa5c0a9e9fb29a60bd4ce78bac9018224bc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13217: 13217
  IGT_8385: 8385

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/index.html

--===============3606249180608841565==
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
<tr><td><b>Series:</b></td><td>Refine FBC test conditions (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149181/">https://patchwork.freedesktop.org/series/149181/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8385 -&gt; IGTPW_13217</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Missing    (3): fi-glk-j4005 bat-arlh-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13217 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736">i915#13736</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_hang:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live@guc_hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i915#14096</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14211">i915#14211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14211">i915#14211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i915#14096</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8385/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13217/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8385 -&gt; IGTPW_13217</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16618: d94defa5c0a9e9fb29a60bd4ce78bac9018224bc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13217: 13217<br />
  IGT_8385: 8385</p>

</body>
</html>

--===============3606249180608841565==--
