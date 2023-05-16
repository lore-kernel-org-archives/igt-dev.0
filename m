Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7431716251598202628=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 16 May 2023 19:18:52 -0000
Message-ID: <168426473281.14224.5706730292115163808@emeril.freedesktop.org>
References: <20230516165558.4061781-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165558.4061781-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_s/i915=5Fpipe=5Foutput=5Fcombo=5Fvalid/intel=5Fpipe=5Foutput?=
 =?utf-8?q?=5Fcombo=5Fvalid/_=28rev2=29?=
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

--===============7431716251598202628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/ (rev2)
URL   : https://patchwork.freedesktop.org/series/117280/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13153 -> IGTPW_8978
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-kbl-soraka fi-snb-2520m bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_8978 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [PASS][1] -> [ABORT][2] ([i915#5122])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][3] ([i915#7077])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg2-11:         [PASS][4] -> [INCOMPLETE][5] ([i915#7609] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adls-5:         NOTRUN -> [DMESG-WARN][6] ([i915#5591])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][7] -> [TIMEOUT][8] ([i915#6794] / [i915#7392])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-rpls-1/igt@i915_selftest@live@mman.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-adls-5:         NOTRUN -> [DMESG-WARN][9] ([i915#4391])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [PASS][10] -> [FAIL][11] ([fdo#103375])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-adls-5:         NOTRUN -> [SKIP][12] ([i915#7828])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][13] -> [FAIL][14] ([i915#7932])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][15] ([i915#1845] / [i915#5354])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adls-5:         NOTRUN -> [SKIP][16] ([i915#1845])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-mtlp-8}:       [DMESG-WARN][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_engines:
    - bat-adls-5:         [ABORT][19] ([i915#4391]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-adls-5/igt@i915_selftest@live@gt_engines.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_selftest@live@gt_engines.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [ABORT][21] ([i915#4579] / [i915#8260]) -> [SKIP][22] ([i915#3555] / [i915#4579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7292 -> IGTPW_8978

  CI-20190529: 20190529
  CI_DRM_13153: 1ceecfa94dd4a059164b23925aecc9db4c4fd3b6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html
  IGT_7292: 9d9475ffd3b5ae18fd8ec120595385f6c562f249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html

--===============7431716251598202628==
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
<tr><td><b>Series:</b></td><td>tests: s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/ (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117280/">https://patchwork.freedesktop.org/series/117280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13153 -&gt; IGTPW_8978</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-kbl-soraka fi-snb-2520m bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8978 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-adls-5/igt@i915_selftest@live@gt_engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-adls-5/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7292 -&gt; IGTPW_8978</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13153: 1ceecfa94dd4a059164b23925aecc9db4c4fd3b6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8978/index.html<br />
  IGT_7292: 9d9475ffd3b5ae18fd8ec120595385f6c562f249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7431716251598202628==--
