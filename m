Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3771587824295767124=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Date: Fri, 09 Jun 2023 17:56:42 -0000
Message-ID: <168633340227.15971.11457775877489608044@emeril.freedesktop.org>
References: <20230609130128.2197571-1-christoph.manszewski@intel.com>
In-Reply-To: <20230609130128.2197571-1-christoph.manszewski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/mocs=3A_Move_mocs_lib?=
 =?utf-8?q?rary_to_=27lib=27_folder?=
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

--===============3771587824295767124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/mocs: Move mocs library to 'lib' folder
URL   : https://patchwork.freedesktop.org/series/119139/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13256 -> IGTPW_9142
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_9142 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@guc:
    - bat-rpls-2:         [PASS][1] -> [DMESG-WARN][2] ([i915#7852])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-2/igt@i915_selftest@live@guc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-2/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][3] -> [INCOMPLETE][4] ([i915#4983] / [i915#7677] / [i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-adlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - {bat-mtlp-8}:       [ABORT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][7] ([i915#4258] / [i915#7913]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_busy@basic@modeset:
    - {bat-adlp-11}:      [ABORT][9] ([i915#4423]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-adlp-11/igt@kms_busy@basic@modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-adlp-11/igt@kms_busy@basic@modeset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [FAIL][11] ([i915#7932]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - fi-cfl-8109u:       [ABORT][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  
#### Warnings ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][15] ([i915#4983] / [i915#7461] / [i915#7981] / [i915#8347] / [i915#8384]) -> [ABORT][16] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-1/igt@i915_selftest@live@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4229]: https://gitlab.freedesktop.org/drm/intel/issues/4229
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7677]: https://gitlab.freedesktop.org/drm/intel/issues/7677
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7322 -> IGTPW_9142

  CI-20190529: 20190529
  CI_DRM_13256: be85dc2d44c075230eec4366e27bc1fe75ee59ff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html

--===============3771587824295767124==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/i915/mocs: Move mocs library to &#39;lib&#39; folder</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119139/">https://patchwork.freedesktop.org/series/119139/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13256 -&gt; IGTPW_9142</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9142 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-2/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-2/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-adlp-9/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7677">i915#7677</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-adlp-11/igt@kms_busy@basic@modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-adlp-11/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13256/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7322 -&gt; IGTPW_9142</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13256: be85dc2d44c075230eec4366e27bc1fe75ee59ff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9142/index.html<br />
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3771587824295767124==--
