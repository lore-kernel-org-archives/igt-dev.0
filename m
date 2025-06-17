Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446ABC71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FCC10E12D;
	Tue, 17 Jun 2025 19:25:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C768610E12D;
 Tue, 17 Jun 2025 19:25:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1989078678686966582=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_gitlab-ci=3A_bump_fedora_?=
 =?utf-8?q?version_to_the_latest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 19:25:52 -0000
Message-ID: <175018835280.88665.18020833837033827339@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
In-Reply-To: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
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

--===============1989078678686966582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gitlab-ci: bump fedora version to the latest
URL   : https://patchwork.freedesktop.org/series/150394/
State : success

== Summary ==

CI Bug Log - changes from IGT_8413 -> IGTPW_13311
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/index.html

Participating hosts (39 -> 44)
------------------------------

  Additional (5): fi-ilk-650 bat-atsm-1 fi-pnv-d510 fi-bsw-nick fi-skl-6600u 

Known issues
------------

  Here are the changes found in IGTPW_13311 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][1] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@fbdev@info:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@fbdev@info.html
    - bat-atsm-1:         NOTRUN -> [SKIP][3] ([i915#1849] / [i915#2582])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-atsm-1:         NOTRUN -> [SKIP][4] ([i915#2582]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@fbdev@read.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][6] +24 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#4083])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][10] ([i915#4077]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6621])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][12] -> [DMESG-FAIL][13] ([i915#14243]) +1 other test dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-arlh-3/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-arlh-3/igt@i915_selftest@live.html
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][14] ([i915#12061] / [i915#13929])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][15] -> [DMESG-WARN][16] ([i915#13735]) +82 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][17] ([i915#13929])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@workarounds:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][18] ([i915#12061])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][19] -> [DMESG-FAIL][20] ([i915#12061]) +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         NOTRUN -> [SKIP][21] ([i915#6077]) +37 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][22] ([i915#6078]) +22 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - fi-skl-6600u:       NOTRUN -> [SKIP][23] +10 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-atsm-1:         NOTRUN -> [SKIP][24] ([i915#6093]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][25] -> [DMESG-WARN][26] ([i915#13735] / [i915#13890]) +49 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] ([i915#11190]) +16 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - bat-atsm-1:         NOTRUN -> [SKIP][28] ([i915#1836]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-ilk-650:         NOTRUN -> [SKIP][29] +24 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][30] ([i915#7357])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][31] +34 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-atsm-1:         NOTRUN -> [SKIP][32] ([i915#6094])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][33] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][34] ([i915#13494]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-mtlp-9/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][36] ([i915#13735]) -> [PASS][37] +81 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][38] ([i915#12061]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][40] ([i915#12061]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][42] ([i915#13735] / [i915#180]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][44] ([i915#13735] / [i915#13890] / [i915#180]) -> [PASS][45] +52 other tests pass
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8413 -> IGTPW_13311
  * Linux: CI_DRM_16712 -> CI_DRM_16715

  CI-20190529: 20190529
  CI_DRM_16712: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16715: eb615557c4565c6236cd13b9cd164d472df1d0ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13311: 13311
  IGT_8413: 8413

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/index.html

--===============1989078678686966582==
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
<tr><td><b>Series:</b></td><td>gitlab-ci: bump fedora version to the latest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150394/">https://patchwork.freedesktop.org/series/150394/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8413 -&gt; IGTPW_13311</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/index.html</p>
<h2>Participating hosts (39 -&gt; 44)</h2>
<p>Additional (5): fi-ilk-650 bat-atsm-1 fi-pnv-d510 fi-bsw-nick fi-skl-6600u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13311 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-pnv-d510/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +82 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-skl-6600u/igt@kms_dsc@dsc-basic.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8413/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13311/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +52 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8413 -&gt; IGTPW_13311</li>
<li>Linux: CI_DRM_16712 -&gt; CI_DRM_16715</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16712: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16715: eb615557c4565c6236cd13b9cd164d472df1d0ed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13311: 13311<br />
  IGT_8413: 8413</p>

</body>
</html>

--===============1989078678686966582==--
