Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7517885059339626923=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Apr 2023 10:06:26 -0000
Message-ID: <168138038613.3695.16694835769402390310@emeril.freedesktop.org>
References: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbWVzb246?=
 =?utf-8?q?_Disable_testplan_build_by_default_=28rev2=29?=
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

--===============7517885059339626923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: meson: Disable testplan build by default (rev2)
URL   : https://patchwork.freedesktop.org/series/116312/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12999 -> IGTPW_8797
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8797 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8797, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8797:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-dg1-7:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg1-7/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg1-7/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_8797 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@migrate:
    - bat-adlp-6:         [PASS][3] -> [DMESG-FAIL][4] ([i915#7699])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-adlp-6/igt@i915_selftest@live@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-adlp-6/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [PASS][5] -> [ABORT][6] ([i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-2:         [PASS][7] -> [ABORT][8] ([i915#7978])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#5354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][10] -> [FAIL][11] ([i915#7932])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][12] ([i915#7699]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - bat-dg2-8:          [FAIL][14] ([i915#7932]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html

  
#### Warnings ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-FAIL][16] ([i915#6367] / [i915#7913] / [i915#7996]) -> [DMESG-FAIL][17] ([i915#6997] / [i915#7913])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7253 -> IGTPW_8797

  CI-20190529: 20190529
  CI_DRM_12999: 10a071db6707a1aedbfc9fa7aece52f3ef7e31a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8797: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html
  IGT_7253: 1a619e8dbc6ca887f2ae24b2d7f1ac536342f58c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@i915_pm_freq_api@freq-basic-api
-igt@i915_pm_freq_api@freq-reset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html

--===============7517885059339626923==
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
<tr><td><b>Series:</b></td><td>meson: Disable testplan build by default (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116312/">https://patchwork.freedesktop.org/series/116312/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12999 -&gt; IGTPW_8797</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8797 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8797, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8797:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg1-7/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg1-7/igt@i915_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8797 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-adlp-6/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-adlp-6/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/fi-kbl-soraka/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12999/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7996">i915#7996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7253 -&gt; IGTPW_8797</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12999: 10a071db6707a1aedbfc9fa7aece52f3ef7e31a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8797: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8797/index.html<br />
  IGT_7253: 1a619e8dbc6ca887f2ae24b2d7f1ac536342f58c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@i915_pm_freq_api@freq-basic-api<br />
-igt@i915_pm_freq_api@freq-reset</p>

</body>
</html>

--===============7517885059339626923==--

