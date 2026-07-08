Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2738C44501
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 07:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7495110E585;
	Wed,  8 Jul 2026 07:23:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB0910F018;
 Wed,  8 Jul 2026 07:22:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6746008314321917012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fs?=
 =?utf-8?q?ystem=5Fallocator=3A_Ignore_expected_CAT_error_in_fault_subtest_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Jul 2026 07:22:41 -0000
Message-ID: <178349536121.164063.4970214601734120010@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707162156.3050135-1-shuicheng.lin@intel.com>
In-Reply-To: <20260707162156.3050135-1-shuicheng.lin@intel.com>
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

--===============6746008314321917012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Ignore expected CAT error in fault subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/169886/
State : success

== Summary ==

CI Bug Log - changes from IGT_8992 -> IGTPW_15486
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15486 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/fi-bsw-nick/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][2] -> [INCOMPLETE][3] ([i915#16565])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/bat-arlh-3/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-arlh-3:         [PASS][4] -> [INCOMPLETE][5] ([i915#16450])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/bat-arlh-3/igt@i915_selftest@live@mman.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/bat-arlh-3/igt@i915_selftest@live@mman.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [ABORT][6] ([i915#16567]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/fi-bsw-nick/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/fi-bsw-nick/igt@i915_selftest@live.html

  
  [i915#16450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16450
  [i915#16565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16565
  [i915#16567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16567


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8992 -> IGTPW_15486

  CI-20190529: 20190529
  CI_DRM_18783: 331949b3b9225375d72a6402cf94b5d6c6621d1c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15486: 15486
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/index.html

--===============6746008314321917012==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Ignore expected CAT error in fault subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169886/">https://patchwork.freedesktop.org/series/169886/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8992 -&gt; IGTPW_15486</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15486 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/fi-bsw-nick/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16565">i915#16565</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/bat-arlh-3/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/bat-arlh-3/igt@i915_selftest@live@mman.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16450">i915#16450</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8992/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16567">i915#16567</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15486/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8992 -&gt; IGTPW_15486</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18783: 331949b3b9225375d72a6402cf94b5d6c6621d1c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15486: 15486<br />
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6746008314321917012==--
