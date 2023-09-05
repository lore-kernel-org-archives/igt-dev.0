Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1300872268258610688=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Tue, 05 Sep 2023 12:13:50 -0000
Message-ID: <169391603033.19171.3754343651444409377@emeril.freedesktop.org>
References: <20230905063833.3159191-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230905063833.3159191-1-tejas.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fdrm=5Ffdinfo=3A_Add_tests_to_read_and_verify_fdinfo?=
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

--===============1300872268258610688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_drm_fdinfo: Add tests to read and verify fdinfo
URL   : https://patchwork.freedesktop.org/series/123264/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13596 -> IGTPW_9715
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9715 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9715, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9715:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@busy@all-engines:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/bat-mtlp-8/igt@gem_busy@busy@all-engines.html

  
Known issues
------------

  Here are the changes found in IGTPW_9715 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][3] -> [DMESG-FAIL][4] ([i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][5] -> [FAIL][6] ([IGT#3] / [i915#6121])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7468 -> IGTPW_9715

  CI-20190529: 20190529
  CI_DRM_13596: c79434429f2411f51da5de1ce729dd414c2a3e65 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9715: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html
  IGT_7468: 7468


Testlist changes
----------------

+igt@xe_drm_fdinfo@basic
+igt@xe_drm_fdinfo@drm-active
+igt@xe_drm_fdinfo@drm-shared
+igt@xe_drm_fdinfo@drm-total-resident

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html

--===============1300872268258610688==
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
<tr><td><b>Series:</b></td><td>tests/xe_drm_fdinfo: Add tests to read and verify fdinfo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123264/">https://patchwork.freedesktop.org/series/123264/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13596 -&gt; IGTPW_9715</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9715 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9715, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9715:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_busy@busy@all-engines:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9715 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13596/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7468 -&gt; IGTPW_9715</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13596: c79434429f2411f51da5de1ce729dd414c2a3e65 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9715: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9715/index.html<br />
  IGT_7468: 7468</p>
<h2>Testlist changes</h2>
<p>+igt@xe_drm_fdinfo@basic<br />
+igt@xe_drm_fdinfo@drm-active<br />
+igt@xe_drm_fdinfo@drm-shared<br />
+igt@xe_drm_fdinfo@drm-total-resident</p>

</body>
</html>

--===============1300872268258610688==--
