Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1060951477412195404=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Tue, 10 Oct 2023 11:56:30 -0000
Message-ID: <169693899044.28099.12529793623663376825@emeril.freedesktop.org>
References: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IHZh?=
 =?utf-8?q?rious_intel=5Fgpu=5Ftop_UI_layout_issues?=
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

--===============1060951477412195404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix various intel_gpu_top UI layout issues
URL   : https://patchwork.freedesktop.org/series/124890/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13733 -> IGTPW_9959
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9959 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9959, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9959:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-9:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-adlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adls-5:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-adls-5/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-adls-5/igt@kms_force_connector_basic@force-connector-state.html

  
Known issues
------------

  Here are the changes found in IGTPW_9959 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][5] -> [DMESG-FAIL][6] ([i915#5334])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][7] -> [ABORT][8] ([i915#8668])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        [SKIP][9] ([fdo#109271]) -> [SKIP][10] ([fdo#109271] / [i915#5190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7523 -> IGTPW_9959

  CI-20190529: 20190529
  CI_DRM_13733: 29b1181aa95a652ac349b7aaa6e727fca46f57aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html
  IGT_7523: 361c2f92f1fe5641090f2fc59951fcaba15387f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_access_counter@invalid-param

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html

--===============1060951477412195404==
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
<tr><td><b>Series:</b></td><td>Fix various intel_gpu_top UI layout issues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124890/">https://patchwork.freedesktop.org/series/124890/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13733 -&gt; IGTPW_9959</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9959 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9959, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9959:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-adls-5/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-adls-5/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9959 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13733/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7523 -&gt; IGTPW_9959</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13733: 29b1181aa95a652ac349b7aaa6e727fca46f57aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9959/index.html<br />
  IGT_7523: 361c2f92f1fe5641090f2fc59951fcaba15387f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_access_counter@invalid-param</p>

</body>
</html>

--===============1060951477412195404==--
