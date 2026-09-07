Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8BFC79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 17:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBFF10E04F;
	Mon,  7 Sep 2026 17:52:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DF110E50D;
 Mon,  7 Sep 2026 17:51:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4094087971179739639=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsriov=5F?=
 =?utf-8?q?mmio=5Fregs=3A_Add_tests_to_verify_registers_on_VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Sep 2026 17:51:08 -0000
Message-ID: <178880346826.130176.13221132132849878492@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
In-Reply-To: <20260907124658.613244-1-lukasz.laguna@intel.com>
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

--===============4094087971179739639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/172772/
State : success

== Summary ==

CI Bug Log - changes from IGT_9085 -> IGTPW_15797
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): bat-arlh-3 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15797 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-arlh-3:         NOTRUN -> [SKIP][1] ([i915#11671]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][2] ([i915#11343])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][3] ([i915#10211] / [i915#11725] / [i915#4079])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][4] ([i915#15657])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arlh-3:         NOTRUN -> [SKIP][5] ([i915#11681])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - bat-arlh-3:         NOTRUN -> [SKIP][6] ([i915#11680]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arlh-3:         NOTRUN -> [SKIP][7] ([i915#11666] / [i915#12203])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-arlh-3:         NOTRUN -> [SKIP][8] ([i915#11666]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arlh-3:         NOTRUN -> [SKIP][9] ([i915#11731]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][10] ([i915#16361])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arlh-3:         NOTRUN -> [SKIP][11] ([i915#10207])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arlh-3:         NOTRUN -> [SKIP][12] ([i915#12637] / [i915#9688]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arlh-3:         NOTRUN -> [SKIP][13] ([i915#8809])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arlh-3:         NOTRUN -> [SKIP][14] ([i915#12637]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arlh-3:         NOTRUN -> [SKIP][15] ([i915#11726]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-arlh-3:         NOTRUN -> [SKIP][16] ([i915#11723])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-write.html

  
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9085 -> IGTPW_15797

  CI-20190529: 20190529
  CI_DRM_19096: 547f981c369d4b8adf60c5d282b37854f11dab17 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15797: 32a0c08136364961c40310553ef3c47ad7b8c295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9085: 9085

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/index.html

--===============4094087971179739639==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172772/">https://patchwork.freedesktop.org/series/172772/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9085 -&gt; IGTPW_15797</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): bat-arlh-3 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15797 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15797/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9085 -&gt; IGTPW_15797</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19096: 547f981c369d4b8adf60c5d282b37854f11dab17 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15797: 32a0c08136364961c40310553ef3c47ad7b8c295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9085: 9085</p>

</body>
</html>

--===============4094087971179739639==--
