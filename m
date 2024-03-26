Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C694EC54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 18:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93310F0DC;
	Tue, 26 Mar 2024 18:40:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E08310F0DC;
 Tue, 26 Mar 2024 18:40:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2295639181762115940=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/kms=5Fpm=5Fdc=3A_Ensure_PSR_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 18:40:49 -0000
Message-ID: <171147844951.1049124.17518544980309271639@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326132012.3747302-1-jouni.hogander@intel.com>
In-Reply-To: <20240326132012.3747302-1-jouni.hogander@intel.com>
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

--===============2295639181762115940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_pm_dc: Ensure PSR is enabled
URL   : https://patchwork.freedesktop.org/series/131632/
State : success

== Summary ==

CI Bug Log - changes from IGT_7785 -> IGTPW_10917
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (2): bat-kbl-2 fi-kbl-8809g 
  Missing    (3): bat-dg2-11 fi-snb-2520m bat-arls-3 

Known issues
------------

  Here are the changes found in IGTPW_10917 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] +39 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][3] ([i915#4991])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@mman:
    - bat-dg2-14:         [ABORT][4] ([i915#10366]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-14/igt@i915_selftest@live@mman.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-dg2-14/igt@i915_selftest@live@mman.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7785 -> IGTPW_10917

  CI-20190529: 20190529
  CI_DRM_14486: 79a0d94585cad50ad2446ebdf3f1317b7d18157c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10917: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html
  IGT_7785: 7785

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html

--===============2295639181762115940==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_pm_dc: Ensure PSR is enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131632/">https://patchwork.freedesktop.org/series/131632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7785 -&gt; IGTPW_10917</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (2): bat-kbl-2 fi-kbl-8809g <br />
  Missing    (3): bat-dg2-11 fi-snb-2520m bat-arls-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10917 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-14/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/bat-dg2-14/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7785 -&gt; IGTPW_10917</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14486: 79a0d94585cad50ad2446ebdf3f1317b7d18157c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10917: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10917/index.html<br />
  IGT_7785: 7785</p>

</body>
</html>

--===============2295639181762115940==--
