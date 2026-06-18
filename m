Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FD6CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 05:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F6D10EC8E;
	Thu, 18 Jun 2026 05:24:48 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511610EC8E;
 Thu, 18 Jun 2026 05:24:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8953698400700385893=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fdsc=3A_Ensure?=
 =?utf-8?q?_non-joiner_modes_on_non-joiner_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Jun 2026 05:24:22 -0000
Message-ID: <178176026234.92016.6989403201258754468@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618043055.2998900-1-karthik.b.s@intel.com>
In-Reply-To: <20260618043055.2998900-1-karthik.b.s@intel.com>
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

--===============8953698400700385893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_dsc: Ensure non-joiner modes on non-joiner subtests
URL   : https://patchwork.freedesktop.org/series/168744/
State : success

== Summary ==

CI Bug Log - changes from IGT_8972 -> IGTPW_15394
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15394 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][3] +12 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8972 -> IGTPW_15394
  * Linux: CI_DRM_18698 -> CI_DRM_18699

  CI-20190529: 20190529
  CI_DRM_18698: 909e0a88ba7edb191c7d3d3bf23b768a5c2407c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18699: 8530e8b67c8dba3eb5b4c025c060a5b3b78262c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15394: dd233c24850565bc5ded754724a21a879ac9269d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8972: 8972

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/index.html

--===============8953698400700385893==
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
<tr><td><b>Series:</b></td><td>tests/kms_dsc: Ensure non-joiner modes on non-joiner subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168744/">https://patchwork.freedesktop.org/series/168744/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8972 -&gt; IGTPW_15394</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-glk-j4005 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15394 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15394/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8972 -&gt; IGTPW_15394</li>
<li>Linux: CI_DRM_18698 -&gt; CI_DRM_18699</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18698: 909e0a88ba7edb191c7d3d3bf23b768a5c2407c3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18699: 8530e8b67c8dba3eb5b4c025c060a5b3b78262c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15394: dd233c24850565bc5ded754724a21a879ac9269d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8972: 8972</p>

</body>
</html>

--===============8953698400700385893==--
