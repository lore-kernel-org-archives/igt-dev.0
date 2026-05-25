Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA257CD5BC0
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 03:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573C310E3A2;
	Mon, 25 May 2026 03:59:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7555F10E3A2;
 Mon, 25 May 2026 03:59:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3908743059124692202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Frotation=5Fcr?=
 =?utf-8?q?c=3A_concurrent_cursor_movement_with_rotation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 May 2026 03:59:08 -0000
Message-ID: <177968154845.3886.14820801912548345722@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525024348.763823-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260525024348.763823-1-santhosh.reddy.guddati@intel.com>
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

--===============3908743059124692202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: concurrent cursor movement with rotation (rev2)
URL   : https://patchwork.freedesktop.org/series/164593/
State : success

== Summary ==

CI Bug Log - changes from IGT_8936 -> IGTPW_15230
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8936 and IGTPW_15230:

### New IGT tests (10) ###

  * igt@gem_busy@busy:
    - Statuses : 40 pass(s)
    - Exec time: [0.02, 0.23] s

  * igt@gem_exec_parallel@engines:
    - Statuses : 40 pass(s)
    - Exec time: [5.58, 38.80] s

  * igt@gem_exec_parallel@engines@basic:
    - Statuses : 40 pass(s)
    - Exec time: [1.34, 7.10] s

  * igt@gem_exec_parallel@engines@contexts:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [0.01, 11.60] s

  * igt@gem_exec_parallel@engines@fds:
    - Statuses : 37 pass(s) 3 skip(s)
    - Exec time: [0.00, 13.29] s

  * igt@gem_exec_store@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.03, 0.19] s

  * igt@gem_softpin@allocator-basic:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@gem_wait@busy:
    - Statuses : 40 pass(s)
    - Exec time: [0.51, 1.89] s

  * igt@gem_wait@wait:
    - Statuses : 40 pass(s)
    - Exec time: [1.02, 1.79] s

  

Known issues
------------

  Here are the changes found in IGTPW_15230 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@dmabuf@all-tests.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-cfl-8109u:       [ABORT][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8936/fi-cfl-8109u/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@i915_module_load@load.html

  
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8936 -> IGTPW_15230
  * Linux: CI_DRM_18540 -> CI_DRM_18544

  CI-20190529: 20190529
  CI_DRM_18540: 127c8434a6a018110189cdb654719a9844702ff7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18544: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15230: 743b63a1f8820cf522893be8df1b9581d83183af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/index.html

--===============3908743059124692202==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: concurrent cursor movement with rotation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164593/">https://patchwork.freedesktop.org/series/164593/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8936 -&gt; IGTPW_15230</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8936 and IGTPW_15230:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.02, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [5.58, 38.80] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.34, 7.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 11.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 37 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 13.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.03, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.51, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.02, 1.79] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15230 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@dmabuf@all-tests.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8936/fi-cfl-8109u/igt@i915_module_load@load.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15230/fi-cfl-8109u/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8936 -&gt; IGTPW_15230</li>
<li>Linux: CI_DRM_18540 -&gt; CI_DRM_18544</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18540: 127c8434a6a018110189cdb654719a9844702ff7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18544: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15230: 743b63a1f8820cf522893be8df1b9581d83183af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3908743059124692202==--
