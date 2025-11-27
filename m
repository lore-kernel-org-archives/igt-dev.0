Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4598BD111A8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 18:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7210E7AD;
	Thu, 27 Nov 2025 18:52:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA58110E860;
 Thu, 27 Nov 2025 18:52:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3574797547846996187=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=5Fres?=
 =?utf-8?q?idency=3A_Add_ASPM_Link_residency_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Nov 2025 18:52:35 -0000
Message-ID: <176426955569.36752.14393235998167321812@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127154807.2899369-1-karthik.poosa@intel.com>
In-Reply-To: <20251127154807.2899369-1-karthik.poosa@intel.com>
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

--===============3574797547846996187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Add ASPM Link residency test (rev3)
URL   : https://patchwork.freedesktop.org/series/157057/
State : success

== Summary ==

CI Bug Log - changes from IGT_8642 -> IGTPW_14127
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/index.html

Participating hosts (44 -> 43)
------------------------------

  Additional (1): fi-kbl-guc 
  Missing    (2): fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_14127 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-guc:         NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([i915#11190]) +16 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-guc:         NOTRUN -> [SKIP][8] +18 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8642 -> IGTPW_14127
  * Linux: CI_DRM_17596 -> CI_DRM_17597

  CI-20190529: 20190529
  CI_DRM_17596: 943d0e69375e5a9030238a697f7d850af0549000 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17597: d858d76d3596e85f00b062a894e38e7fda3d9916 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14127: 823af0640a53d8bd99b9a28d6a0bfdc9eee2d48d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/index.html

--===============3574797547846996187==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Add ASPM Link residency test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157057/">https://patchwork.freedesktop.org/series/157057/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8642 -&gt; IGTPW_14127</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Additional (1): fi-kbl-guc <br />
  Missing    (2): fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14127 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14127/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8642 -&gt; IGTPW_14127</li>
<li>Linux: CI_DRM_17596 -&gt; CI_DRM_17597</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17596: 943d0e69375e5a9030238a697f7d850af0549000 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17597: d858d76d3596e85f00b062a894e38e7fda3d9916 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14127: 823af0640a53d8bd99b9a28d6a0bfdc9eee2d48d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3574797547846996187==--
