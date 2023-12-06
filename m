Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3921090240502413723=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Grzegorzek" <dominik.grzegorzek@intel.com>
Date: Wed, 06 Dec 2023 20:47:31 -0000
Message-ID: <170189565161.26423.16495024137505951336@emeril.freedesktop.org>
References: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Use_COMPUTE_instead_of_RENDER_engine_for_X?=
 =?utf-8?q?e_if_missing?=
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

--===============3921090240502413723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Use COMPUTE instead of RENDER engine for Xe if missing
URL   : https://patchwork.freedesktop.org/series/127451/
State : success

== Summary ==

CI Bug Log - changes from IGT_7626 -> IGTPW_10356
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10356 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-mtlp-6:         NOTRUN -> [ABORT][1] ([i915#8213] / [i915#8668])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html
    - bat-kbl-2:          NOTRUN -> [ABORT][2] ([i915#9793])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@fbdev@info.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-6:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([fdo#109285])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#5274])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#4342] / [i915#5354])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([i915#9792]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#5354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr_primary_mmap_gtt:
    - bat-kbl-2:          NOTRUN -> [SKIP][10] ([fdo#109271]) +35 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#9673] / [i915#9736] / [i915#9806]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#8809])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] ([i915#3708] / [i915#9792])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#3708] / [i915#4077]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#3708]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-mtlp-6:         [INCOMPLETE][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7626/bat-mtlp-6/igt@kms_force_connector_basic@force-edid.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@force-edid.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9736]: https://gitlab.freedesktop.org/drm/intel/issues/9736
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9793]: https://gitlab.freedesktop.org/drm/intel/issues/9793
  [i915#9806]: https://gitlab.freedesktop.org/drm/intel/issues/9806


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7626 -> IGTPW_10356

  CI-20190529: 20190529
  CI_DRM_13988: 6ae23377ae459d8506ecdd2f538bfee2f52652f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10356: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html

--===============3921090240502413723==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Use COMPUTE instead of RENDER engine for Xe if missing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127451/">https://patchwork.freedesktop.org/series/127451/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7626 -&gt; IGTPW_10356</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10356 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9793">i915#9793</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt:</p>
<ul>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-kbl-2/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9736">i915#9736</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9806">i915#9806</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7626/bat-mtlp-6/igt@kms_force_connector_basic@force-edid.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/bat-mtlp-6/igt@kms_force_connector_basic@force-edid.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7626 -&gt; IGTPW_10356</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13988: 6ae23377ae459d8506ecdd2f538bfee2f52652f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10356: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3921090240502413723==--
