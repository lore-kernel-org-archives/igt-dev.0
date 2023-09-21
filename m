Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2907663361307657403=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 21 Sep 2023 00:11:17 -0000
Message-ID: <169525507756.7233.8434913418671888105@emeril.freedesktop.org>
References: <20230920223905.268940-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230920223905.268940-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_add_GFX11_to_tests?=
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

--===============2907663361307657403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add GFX11 to tests
URL   : https://patchwork.freedesktop.org/series/124018/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13659 -> IGTPW_9833
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9833 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9833, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9833:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - bat-dg2-11:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html

  
Known issues
------------

  Here are the changes found in IGTPW_9833 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy@all-engines:
    - bat-mtlp-8:         [PASS][2] -> [DMESG-FAIL][3] ([i915#8962])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@gem_busy@busy@all-engines.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-mtlp-8:         NOTRUN -> [ABORT][4] ([i915#9262])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][5] -> [DMESG-FAIL][6] ([i915#5334])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][7] ([i915#6645])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [DMESG-FAIL][8] ([i915#5334]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg2-11:         [INCOMPLETE][10] ([i915#7609] / [i915#7913]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][12] ([i915#9262]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][14] ([i915#7952]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][16] ([IGT#3] / [i915#6121]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7494 -> IGTPW_9833

  CI-20190529: 20190529
  CI_DRM_13659: b64f074fa9711dea043833b2d0990d1a4f7a36ac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html
  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html

--===============2907663361307657403==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add GFX11 to tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124018/">https://patchwork.freedesktop.org/series/124018/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13659 -&gt; IGTPW_9833</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9833 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9833, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9833:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3@lmem0:<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9833 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13659/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7494 -&gt; IGTPW_9833</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13659: b64f074fa9711dea043833b2d0990d1a4f7a36ac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9833/index.html<br />
  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2907663361307657403==--
