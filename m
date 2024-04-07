Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241EECD11C2
	for <igt-dev@archiver.kernel.org>; Sun,  7 Apr 2024 04:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B5610F7B0;
	Sun,  7 Apr 2024 04:04:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFE110F7AC;
 Sun,  7 Apr 2024 04:04:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8917048709780600395=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_add_gem_cre?=
 =?utf-8?q?ate_fuzzing_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vitaly Prosyak" <vitaly.prosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 07 Apr 2024 04:04:34 -0000
Message-ID: <171246267478.1255972.16920994366704281997@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240407032226.3732495-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240407032226.3732495-1-vitaly.prosyak@amd.com>
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

--===============8917048709780600395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add gem create fuzzing test (rev3)
URL   : https://patchwork.freedesktop.org/series/131671/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14538 -> IGTPW_10988
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (2): bat-kbl-2 fi-kbl-8809g 
  Missing    (5): bat-mtlp-9 fi-snb-2520m fi-glk-j4005 bat-rpls-3 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_10988 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] +39 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][3] ([i915#10689])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - bat-dg2-8:          [ABORT][4] ([i915#10366]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14538/bat-dg2-8/igt@i915_selftest@live@gt_timelines.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-dg2-8/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@late_gt_pm:
    - bat-dg2-9:          [ABORT][6] ([i915#10366]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14538/bat-dg2-9/igt@i915_selftest@live@late_gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-dg2-9/igt@i915_selftest@live@late_gt_pm.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10689]: https://gitlab.freedesktop.org/drm/intel/issues/10689
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7801 -> IGTPW_10988

  CI-20190529: 20190529
  CI_DRM_14538: 1bace689230323abe9cd3dfc6dd011fa5f9e6a05 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10988: 10988
  IGT_7801: 7801

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/index.html

--===============8917048709780600395==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add gem create fuzzing test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131671/">https://patchwork.freedesktop.org/series/131671/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14538 -&gt; IGTPW_10988</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (2): bat-kbl-2 fi-kbl-8809g <br />
  Missing    (5): bat-mtlp-9 fi-snb-2520m fi-glk-j4005 bat-rpls-3 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10988 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10689">i915#10689</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14538/bat-dg2-8/igt@i915_selftest@live@gt_timelines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-dg2-8/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14538/bat-dg2-9/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10988/bat-dg2-9/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7801 -&gt; IGTPW_10988</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14538: 1bace689230323abe9cd3dfc6dd011fa5f9e6a05 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10988: 10988<br />
  IGT_7801: 7801</p>

</body>
</html>

--===============8917048709780600395==--
