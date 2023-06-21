Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7314594393829763479=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Dec" <katarzyna.dec@intel.com>
Date: Wed, 21 Jun 2023 10:52:35 -0000
Message-ID: <168734475548.7801.2969630497254240924@emeril.freedesktop.org>
References: <20230621094238.1823567-1-katarzyna.dec@intel.com>
In-Reply-To: <20230621094238.1823567-1-katarzyna.dec@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU0VORE1B?=
 =?utf-8?q?IL_test_tests/intel-ci=3A_Add_xe=5Fmmap_and_xe=5Fcreate_tests_t?=
 =?utf-8?q?o_f-f?=
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

--===============7314594393829763479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: SENDMAIL test tests/intel-ci: Add xe_mmap and xe_create tests to f-f
URL   : https://patchwork.freedesktop.org/series/119666/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7342 -> IGTPW_9228
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9228 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9228, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html

Participating hosts (43 -> 43)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9228:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-massive-size}:
    - {bat-dg1-8}:        NOTRUN -> [FAIL][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-dg1-8/igt@xe_create@create-massive-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_9228 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-rkl-11600:       [PASS][3] -> [FAIL][4] ([fdo#103375] / [i915#8011])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][7] -> [ABORT][8] ([i915#4423])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-adlp-11/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#5334] / [i915#7872])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][10] ([i915#1886] / [i915#7913])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [PASS][11] -> [ABORT][12] ([i915#7911] / [i915#7920])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-1/igt@i915_selftest@live@requests.html
    - bat-mtlp-6:         [PASS][13] -> [DMESG-FAIL][14] ([i915#8497])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271]) +14 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][16] -> [FAIL][17] ([i915#7932])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4579])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [DMESG-FAIL][19] ([i915#7059]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][21] ([i915#4258] / [i915#7913]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][23] ([i915#6367]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@slpc.html
    - bat-rpls-2:         [DMESG-WARN][25] ([i915#6367]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [SKIP][27] ([i915#3555] / [i915#4579]) -> [ABORT][28] ([i915#4579] / [i915#8260])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7342 -> IGTPW_9228

  CI-20190529: 20190529
  CI_DRM_13297: 0e4da468fc093f8c8a1a82e5adabf24c67d46c6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9228: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html
  IGT_7342: 780270dcf9b2d31621317e36e630859e6a91f56d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html

--===============7314594393829763479==
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
<tr><td><b>Series:</b></td><td>SENDMAIL test tests/intel-ci: Add xe_mmap and xe_create tests to f-f</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119666/">https://patchwork.freedesktop.org/series/119666/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7342 -&gt; IGTPW_9228</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9228 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9228, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html</p>
<h2>Participating hosts (43 -&gt; 43)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9228:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_create@create-massive-size}:<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-dg1-8/igt@xe_create@create-massive-size.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9228 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rpls-2/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7342/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7342 -&gt; IGTPW_9228</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13297: 0e4da468fc093f8c8a1a82e5adabf24c67d46c6f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9228: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9228/index.html<br />
  IGT_7342: 780270dcf9b2d31621317e36e630859e6a91f56d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7314594393829763479==--
