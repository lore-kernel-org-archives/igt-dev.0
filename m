Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA20C3DA61
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 20:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37BD10E00C;
	Wed, 24 Jul 2024 20:27:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0710E00C;
 Wed, 24 Jul 2024 20:26:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3448334360350344964=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsto?=
 =?utf-8?q?re=3A_Modify_test_for_Priority_Mem_Read_feature?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Jul 2024 20:26:59 -0000
Message-ID: <172185281946.363572.10700631787326846368@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724194006.1201429-1-pallavi.mishra@intel.com>
In-Reply-To: <20240724194006.1201429-1-pallavi.mishra@intel.com>
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

--===============3448334360350344964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_store: Modify test for Priority Mem Read feature
URL   : https://patchwork.freedesktop.org/series/136457/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15126 -> IGTPW_11450
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/index.html

Participating hosts (40 -> 38)
------------------------------

  Additional (3): fi-cfl-8109u bat-mtlp-8 fi-kbl-8809g 
  Missing    (5): bat-adlp-9 fi-snb-2520m bat-adlp-6 bat-dg2-14 bat-dg2-11 

Known issues
------------

  Here are the changes found in IGTPW_11450 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][7] ([i915#4083])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#4077]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [PASS][10] -> [DMESG-WARN][11] ([i915#10062] / [i915#1982])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15126/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#6621])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       [PASS][13] -> [DMESG-WARN][14] ([i915#11621]) +31 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15126/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][15] ([i915#5190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#4212]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-mtlp-8:         NOTRUN -> [SKIP][17] ([i915#4213]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#3840] / [i915#9159])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][19] +30 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#5274])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][22] +11 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][23] ([i915#4077] / [i915#9688])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#8809])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-8:         NOTRUN -> [SKIP][25] ([i915#3708] / [i915#4077]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][26] ([i915#3708]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-8:         NOTRUN -> [SKIP][27] ([i915#10216] / [i915#3708])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-write.html

  
  [i915#10062]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7936 -> IGTPW_11450

  CI-20190529: 20190529
  CI_DRM_15126: ff2008797dfd5aa629d782f65012a4690da4cd1e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11450: 11450
  IGT_7936: 7936

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/index.html

--===============3448334360350344964==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_store: Modify test for Priority Mem Read feature</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136457/">https://patchwork.freedesktop.org/series/136457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15126 -&gt; IGTPW_11450</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Additional (3): fi-cfl-8109u bat-mtlp-8 fi-kbl-8809g <br />
  Missing    (5): bat-adlp-9 fi-snb-2520m bat-adlp-6 bat-dg2-14 bat-dg2-11 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11450 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15126/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10062">i915#10062</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15126/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11450/bat-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7936 -&gt; IGTPW_11450</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15126: ff2008797dfd5aa629d782f65012a4690da4cd1e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11450: 11450<br />
  IGT_7936: 7936</p>

</body>
</html>

--===============3448334360350344964==--
