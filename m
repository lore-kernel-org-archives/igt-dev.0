Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37CCD3C52B
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 11:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1F310E6CD;
	Wed, 10 Dec 2025 11:05:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F97010E202;
 Wed, 10 Dec 2025 11:05:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0933660473772397442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpat=3A_a?=
 =?utf-8?q?dd_helper_funtion_to_read_PAT_table_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Dec 2025 11:05:46 -0000
Message-ID: <176536474625.73489.17353347983965201151@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251113070502.2148615-1-x.wang@intel.com>
In-Reply-To: <20251113070502.2148615-1-x.wang@intel.com>
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

--===============0933660473772397442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: add helper funtion to read PAT table (rev4)
URL   : https://patchwork.freedesktop.org/series/157481/
State : success

== Summary ==

CI Bug Log - changes from IGT_8662 -> IGTPW_14179
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/index.html

Participating hosts (18 -> 13)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (6): fi-tgl-1115g4 fi-ivb-3770 bat-rpls-4 bat-adls-6 bat-dg2-13 bat-dg2-11 

Known issues
------------

  Here are the changes found in IGTPW_14179 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-glk-j4005:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live:
    - fi-glk-j4005:       NOTRUN -> [ABORT][3] ([i915#15399]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@i915_selftest@live.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][4] +11 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][5] ([i915#13929]) -> [DMESG-FAIL][6] ([i915#14204])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8662/bat-atsm-1/igt@i915_selftest@live@mman.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#15399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15399
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8662 -> IGTPW_14179
  * Linux: CI_DRM_17650 -> CI_DRM_17651

  CI-20190529: 20190529
  CI_DRM_17650: 12271f632915efe0c5d4171b9c0e90f57ecdfe01 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17651: 46691bf8a4a5a4887c079a41007e98b037e06ffb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14179: 14179
  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/index.html

--===============0933660473772397442==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: add helper funtion to read PAT table (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157481/">https://patchwork.freedesktop.org/series/157481/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8662 -&gt; IGTPW_14179</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/index.html</p>
<h2>Participating hosts (18 -&gt; 13)</h2>
<p>Additional (1): fi-glk-j4005 <br />
  Missing    (6): fi-tgl-1115g4 fi-ivb-3770 bat-rpls-4 bat-adls-6 bat-dg2-13 bat-dg2-11 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14179 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15399">i915#15399</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8662/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14179/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8662 -&gt; IGTPW_14179</li>
<li>Linux: CI_DRM_17650 -&gt; CI_DRM_17651</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17650: 12271f632915efe0c5d4171b9c0e90f57ecdfe01 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17651: 46691bf8a4a5a4887c079a41007e98b037e06ffb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14179: 14179<br />
  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0933660473772397442==--
