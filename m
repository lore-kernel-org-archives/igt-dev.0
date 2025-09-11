Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA2ACAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 14:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594D10EB54;
	Thu, 11 Sep 2025 14:33:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D83510EB54;
 Thu, 11 Sep 2025 14:33:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2485188369491784118=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_DONT=5FMERGE=3A_tests/xe?=
 =?utf-8?q?=5Fintel=5Fbb=3A_repro_for_pthread=5Fkill=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Sep 2025 14:33:18 -0000
Message-ID: <175760119843.326696.9374877862396321413@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
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

--===============2485188369491784118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()
URL   : https://patchwork.freedesktop.org/series/154383/
State : success

== Summary ==

CI Bug Log - changes from IGT_8535 -> IGTPW_13732
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): bat-arlh-3 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13732 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][1] -> [ABORT][2] ([i915#12904]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-apl-1/igt@dmabuf@all-tests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-arlh-3:         NOTRUN -> [SKIP][3] ([i915#11671]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][4] ([i915#11343])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][5] ([i915#10211] / [i915#11725] / [i915#4079])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][6] ([i915#11724] / [i915#4079])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arlh-3:         NOTRUN -> [SKIP][7] ([i915#11681])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@client:
    - bat-dg2-9:          [PASS][8] -> [INCOMPLETE][9] ([i915#14201])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-9/igt@i915_selftest@live@client.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-9/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         NOTRUN -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [PASS][11] -> [DMESG-FAIL][12] ([i915#12061]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][13] -> [DMESG-FAIL][14] ([i915#12061]) +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-arlh-3:         NOTRUN -> [SKIP][15] ([i915#11680]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arlh-3:         NOTRUN -> [SKIP][16] ([i915#11666] / [i915#12203])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - bat-arlh-3:         NOTRUN -> [SKIP][17] ([i915#11666]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arlh-3:         NOTRUN -> [SKIP][18] ([i915#11731]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arlh-3:         NOTRUN -> [SKIP][19] ([i915#9886])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arlh-3:         NOTRUN -> [SKIP][20] ([i915#10207])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arlh-3:         NOTRUN -> [SKIP][21] ([i915#12637] / [i915#9688]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arlh-3:         NOTRUN -> [SKIP][22] ([i915#8809])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arlh-3:         NOTRUN -> [SKIP][23] ([i915#12637]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arlh-3:         NOTRUN -> [SKIP][24] ([i915#11726]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-arlh-3:         NOTRUN -> [SKIP][25] ([i915#11723])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][26] ([i915#13494]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-9/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][28] ([i915#12061]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-8/igt@i915_selftest@live.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][30] ([i915#12061]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-9:          [DMESG-FAIL][32] ([i915#12061]) -> [INCOMPLETE][33] ([i915#12061] / [i915#14201])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-9/igt@i915_selftest@live.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-9/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][34] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][35] ([i915#12061] / [i915#13929])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-atsm-1/igt@i915_selftest@live.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][36] ([i915#14204]) -> [DMESG-FAIL][37] ([i915#13929])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-atsm-1/igt@i915_selftest@live@mman.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8535 -> IGTPW_13732
  * Linux: CI_DRM_17173 -> CI_DRM_17174

  CI-20190529: 20190529
  CI_DRM_17173: f251150579f93807f196c33b8716f14c1fd136e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17174: a76438ef96a214378c040a10b853f9b52b4ded60 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13732: 13732
  IGT_8535: 8535

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/index.html

--===============2485188369491784118==
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
<tr><td><b>Series:</b></td><td>DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154383/">https://patchwork.freedesktop.org/series/154383/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8535 -&gt; IGTPW_13732</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): bat-arlh-3 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13732 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-apl-1/igt@dmabuf@all-tests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724">i915#11724</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-9/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-9/igt@i915_selftest@live@client.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731">i915#11731</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-arlh-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-dg2-9/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-dg2-9/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8535/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13732/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8535 -&gt; IGTPW_13732</li>
<li>Linux: CI_DRM_17173 -&gt; CI_DRM_17174</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17173: f251150579f93807f196c33b8716f14c1fd136e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17174: a76438ef96a214378c040a10b853f9b52b4ded60 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13732: 13732<br />
  IGT_8535: 8535</p>

</body>
</html>

--===============2485188369491784118==--
