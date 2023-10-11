Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6599958784995398406=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Wed, 11 Oct 2023 13:29:26 -0000
Message-ID: <169703096621.26513.1374821359313590410@emeril.freedesktop.org>
References: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IHZh?=
 =?utf-8?q?rious_intel=5Fgpu=5Ftop_UI_layout_issues_=28rev2=29?=
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

--===============6599958784995398406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix various intel_gpu_top UI layout issues (rev2)
URL   : https://patchwork.freedesktop.org/series/124890/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13740 -> IGTPW_9969
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-hsw-4770 bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9969 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] ([i915#8213] / [i915#9262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][3] ([IGT#3]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][5] ([i915#8668]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7530 -> IGTPW_9969

  CI-20190529: 20190529
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html
  IGT_7530: 9f420648bface59553ffd4481d17ba14b7982840 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html

--===============6599958784995398406==
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
<tr><td><b>Series:</b></td><td>Fix various intel_gpu_top UI layout issues (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124890/">https://patchwork.freedesktop.org/series/124890/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13740 -&gt; IGTPW_9969</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-hsw-4770 bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9969 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3@smem:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7530 -&gt; IGTPW_9969</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9969/index.html<br />
  IGT_7530: 9f420648bface59553ffd4481d17ba14b7982840 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6599958784995398406==--
