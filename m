Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8083476742490368459=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Wed, 06 Dec 2023 23:39:28 -0000
Message-ID: <170190596895.26424.468173565300165133@emeril.freedesktop.org>
References: <20231206200055.20417-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231206200055.20417-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgeGU6IFZh?=
 =?utf-8?q?lidate_fixed_CCS_mode_setting_=28rev2=29?=
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

--===============8083476742490368459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Validate fixed CCS mode setting (rev2)
URL   : https://patchwork.freedesktop.org/series/127453/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13990 -> IGTPW_10359
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html

Participating hosts (37 -> 34)
------------------------------

  Missing    (3): bat-kbl-2 fi-snb-2520m bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_10359 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#9662])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [INCOMPLETE][3] ([i915#9275]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - bat-adlp-11:        [DMESG-FAIL][5] ([i915#6868]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp6:
    - bat-adlp-11:        [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][9] ([IGT#3]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9662]: https://gitlab.freedesktop.org/drm/intel/issues/9662


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7626 -> IGTPW_10359

  CI-20190529: 20190529
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10359: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html

--===============8083476742490368459==
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
<tr><td><b>Series:</b></td><td>xe: Validate fixed CCS mode setting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127453/">https://patchwork.freedesktop.org/series/127453/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13990 -&gt; IGTPW_10359</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): bat-kbl-2 fi-snb-2520m bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10359 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9662">i915#9662</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7626 -&gt; IGTPW_10359</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10359: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10359/index.html<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_compute@ccs-mode-basic<br />
+igt@xe_compute@ccs-mode-compute-kernel</p>

</body>
</html>

--===============8083476742490368459==--
