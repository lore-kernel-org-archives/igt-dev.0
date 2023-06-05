Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0224101820094539179=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Mon, 05 Jun 2023 21:39:39 -0000
Message-ID: <168600117911.24737.10134732500955625649@emeril.freedesktop.org>
References: <20230605183612.41463-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230605183612.41463-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBD?=
 =?utf-8?q?ancel_all_outstanding_requests_at_the_start_of_a_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0224101820094539179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Cancel all outstanding requests at the start of a test
URL   : https://patchwork.freedesktop.org/series/118885/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13232 -> IGTPW_9109
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (2): fi-rkl-11600 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9109:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:
    - {bat-adlp-11}:      NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13232 and IGTPW_9109:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9109 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         NOTRUN -> [SKIP][2] ([i915#7456])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@read:
    - bat-rpls-2:         NOTRUN -> [SKIP][3] ([i915#2582]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-rpls-2:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#3282])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-rpls-2:         NOTRUN -> [SKIP][6] ([i915#7561])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][7] ([i915#7077])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_pm_rps@basic-api:
    - bat-rpls-2:         NOTRUN -> [SKIP][8] ([i915#6621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][9] ([i915#4258] / [i915#7913])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [PASS][10] -> [ABORT][11] ([i915#7913] / [i915#7979])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         NOTRUN -> [ABORT][12] ([i915#7913] / [i915#7982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][13] ([i915#1845]) +14 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_busy@basic.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#7828]) +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#3637]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-rpls-2:         NOTRUN -> [SKIP][16] ([fdo#109285])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][17] ([i915#1849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][18] -> [FAIL][19] ([i915#7932]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rpls-2:         NOTRUN -> [SKIP][20] ([i915#1072]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rpls-2:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#4579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-rpls-2:         NOTRUN -> [SKIP][22] ([fdo#109295] / [i915#1845] / [i915#3708])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][23] ([fdo#109295] / [i915#3708]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@flip:
    - {bat-adlp-11}:      [ABORT][24] ([i915#4423]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-adlp-11/igt@kms_busy@basic@flip.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-adlp-11/igt@kms_busy@basic@flip.html

  
#### Warnings ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][26] ([i915#4983] / [i915#7461] / [i915#7981] / [i915#8347] / [i915#8384]) -> [ABORT][27] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-rpls-1/igt@i915_selftest@live@reset.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [ABORT][28] ([i915#4579] / [i915#8260]) -> [SKIP][29] ([i915#3555] / [i915#4579])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
  [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7319 -> IGTPW_9109

  CI-20190529: 20190529
  CI_DRM_13232: 450d228e38403a48aa273ec1e22b463dc64aaae6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html

--===============0224101820094539179==
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
<tr><td><b>Series:</b></td><td>lib: Cancel all outstanding requests at the start of a test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118885/">https://patchwork.freedesktop.org/series/118885/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13232 -&gt; IGTPW_9109</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (2): fi-rkl-11600 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9109:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:<ul>
<li>{bat-adlp-11}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13232 and IGTPW_9109:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-5:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9109 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7979">i915#7979</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_busy@basic@flip:<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-adlp-11/igt@kms_busy@basic@flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-adlp-11/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7319 -&gt; IGTPW_9109</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13232: 450d228e38403a48aa273ec1e22b463dc64aaae6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html<br />
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0224101820094539179==--
