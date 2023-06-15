Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7429721204606331619=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Jun 2023 11:22:01 -0000
Message-ID: <168682812195.10727.10444093898544526544@emeril.freedesktop.org>
References: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRW5hYmxl?=
 =?utf-8?q?_Xe_KUnit_tests_and_fix_a_warning?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7429721204606331619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Xe KUnit tests and fix a warning
URL   : https://patchwork.freedesktop.org/series/119378/
State : success

== Summary ==

CI Bug Log - changes from IGT_7330 -> IGTPW_9177
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): fi-kbl-soraka bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9177 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [PASS][1] -> [DMESG-FAIL][2] ([i915#4258] / [i915#7913])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][3] ([i915#6367])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][4] ([i915#6687] / [i915#7978])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-11:        NOTRUN -> [ABORT][5] ([i915#4423] / [i915#6868])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-adlp-11/igt@kms_busy@basic@modeset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][6] -> [FAIL][7] ([i915#7932])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html

  
#### Possible fixes ####

  * igt@gem_wait@busy@all-engines:
    - bat-adlp-11:        [ABORT][8] ([i915#8133]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@gem_wait@busy@all-engines.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-adlp-11/igt@gem_wait@busy@all-engines.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][10] ([i915#5334]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][12] ([i915#7699]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][14] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
    - bat-dg2-11:         [INCOMPLETE][16] ([i915#7908]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         [SKIP][18] ([i915#1072]) -> [ABORT][19] ([i915#8442])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7908]: https://gitlab.freedesktop.org/drm/intel/issues/7908
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8133]: https://gitlab.freedesktop.org/drm/intel/issues/8133
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7330 -> IGTPW_9177

  CI-20190529: 20190529
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html

--===============7429721204606331619==
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
<tr><td><b>Series:</b></td><td>Enable Xe KUnit tests and fix a warning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119378/">https://patchwork.freedesktop.org/series/119378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7330 -&gt; IGTPW_9177</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): fi-kbl-soraka bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9177 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-adlp-11/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_wait@busy@all-engines:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@gem_wait@busy@all-engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8133">i915#8133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-adlp-11/igt@gem_wait@busy@all-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7908">i915#7908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7330 -&gt; IGTPW_9177</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9177/index.html<br />
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7429721204606331619==--

