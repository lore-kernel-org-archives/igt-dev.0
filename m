Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD0CFB44D
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4210E3EC;
	Mon,  7 Oct 2024 17:10:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C7910E213;
 Mon,  7 Oct 2024 17:10:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4764082762376857700=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/vmwgfx=3A_Add_test_th?=
 =?utf-8?q?at_draws_triangle_without_using_3d_commands=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maaz Mombasawala" <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Oct 2024 17:10:08 -0000
Message-ID: <172832100865.1199553.15843860439740132311@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
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

--===============4764082762376857700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/vmwgfx: Add test that draws triangle without using 3d commands.
URL   : https://patchwork.freedesktop.org/series/139588/
State : success

== Summary ==

CI Bug Log - changes from IGT_8054 -> IGTPW_11875
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): bat-rpls-4 

Known issues
------------

  Here are the changes found in IGTPW_11875 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-9:          [PASS][1] -> [DMESG-FAIL][2] ([i915#12133] / [i915#9500])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-dg2-9/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-dg2-9/igt@i915_selftest@live.html
    - bat-arls-2:         [PASS][3] -> [DMESG-WARN][4] ([i915#10341] / [i915#12133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-9:          [PASS][5] -> [DMESG-FAIL][6] ([i915#9500])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][7] -> [DMESG-WARN][8] ([i915#11349])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8054 -> IGTPW_11875
  * Linux: CI_DRM_15484 -> CI_DRM_15485

  CI-20190529: 20190529
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11875: 11875
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/index.html

--===============4764082762376857700==
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
<tr><td><b>Series:</b></td><td>tests/vmwgfx: Add test that draws triangle without using 3d commands.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139588/">https://patchwork.freedesktop.org/series/139588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8054 -&gt; IGTPW_11875</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): bat-rpls-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11875 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-dg2-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-dg2-9/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-arls-2/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-dg2-9/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11875/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8054 -&gt; IGTPW_11875</li>
<li>Linux: CI_DRM_15484 -&gt; CI_DRM_15485</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11875: 11875<br />
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4764082762376857700==--
