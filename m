Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1345353936504827091=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anna Karas" <anna.karas@intel.com>
Date: Wed, 10 May 2023 09:45:53 -0000
Message-ID: <168371195333.7573.15090730408719706031@emeril.freedesktop.org>
References: <20230510084451.354060-1-anna.karas@intel.com>
In-Reply-To: <20230510084451.354060-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2Ry?=
 =?utf-8?q?mtest=3A_Add_function_drm=5Freopen=5Fdriver=28=29?=
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

--===============1345353936504827091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/drmtest: Add function drm_reopen_driver()
URL   : https://patchwork.freedesktop.org/series/117565/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13129 -> IGTPW_8939
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8939 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8939, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8939:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - bat-adlp-9:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13129 and IGTPW_8939:

### New IGT tests (4) ###

  * igt@i915_suspend@basic-s2idle-without-i915:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_suspend@basic-s3-without-i915:
    - Statuses : 1 abort(s) 1 incomplete(s) 27 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@read-crc:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8939 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][3] ([i915#7077])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [PASS][4] -> [ABORT][5] ([i915#4983] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-rpls-2/igt@i915_selftest@live@requests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915 (NEW):
    - {bat-mtlp-6}:       NOTRUN -> [SKIP][6] ([i915#6645])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
    - {bat-mtlp-8}:       NOTRUN -> [SKIP][7] ([i915#6645])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - bat-adlp-9:         [PASS][8] -> [FAIL][9] ([i915#4190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][10] -> [FAIL][11] ([i915#7932])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][12] ([i915#3546]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][13] ([i915#5334] / [i915#7872]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [ABORT][15] ([i915#4983] / [i915#7920] / [i915#7953]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-8/igt@i915_selftest@live@requests.html
    - {bat-mtlp-6}:       [ABORT][17] ([i915#4983] / [i915#7920] / [i915#7953]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-6/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [ABORT][19] -> [SKIP][20] ([i915#3555] / [i915#4579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4190]: https://gitlab.freedesktop.org/drm/intel/issues/4190
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7285 -> IGTPW_8939

  CI-20190529: 20190529
  CI_DRM_13129: 451e49cfbaa90720149e63f4fa9c7824013c783d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8939: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html

--===============1345353936504827091==
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
<tr><td><b>Series:</b></td><td>lib/drmtest: Add function drm_reopen_driver()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117565/">https://patchwork.freedesktop.org/series/117565/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13129 -&gt; IGTPW_8939</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8939 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8939, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8939:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@c-dp1:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13129 and IGTPW_8939:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>Statuses : 1 abort(s) 1 incomplete(s) 27 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8939 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915 (NEW):</p>
<ul>
<li>
<p>{bat-mtlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
<li>
<p>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4190">i915#4190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7953">i915#7953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7953">i915#7953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13129/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7285 -&gt; IGTPW_8939</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13129: 451e49cfbaa90720149e63f4fa9c7824013c783d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8939: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8939/index.html<br />
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1345353936504827091==--
