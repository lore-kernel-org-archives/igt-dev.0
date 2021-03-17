Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Mar 2021 16:12:45 -0000
Message-ID: <161599756509.17367.9968175916872780770@emeril.freedesktop.org>
References: <20210316110434.101381-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210316110434.101381-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9p?=
 =?utf-8?q?915/gem=5Fexec=5Freloc=3A_check_reloc_support_in_GEM?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1692766834=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1692766834==
Content-Type: multipart/alternative;
 boundary="===============2003096784194543328=="

--===============2003096784194543328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/i915/gem_exec_reloc: check reloc support in GEM
URL   : https://patchwork.freedesktop.org/series/88005/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9860 -> IGTPW_5607
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html

Known issues
------------

  Here are the changes found in IGTPW_5607 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-6600u:       [PASS][1] -> [FAIL][2] ([i915#3239])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [TIMEOUT][3] ([i915#3145]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
  [i915#3180]: https://gitlab.freedesktop.org/drm/intel/issues/3180
  [i915#3239]: https://gitlab.freedesktop.org/drm/intel/issues/3239


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6033 -> IGTPW_5607

  CI-20190529: 20190529
  CI_DRM_9860: 2f5c82c9a6a468ec8b20a3bb322c3289fb05e77b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html
  IGT_6033: ecfe4c613cdbc082e4a561ead120b40349b63f2b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html

--===============2003096784194543328==
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
<tr><td><b>Series:</b></td><td>test/i915/gem_exec_reloc: check reloc support in GEM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88005/">https://patchwork.freedesktop.org/series/88005/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9860 -&gt; IGTPW_5607</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5607 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3239">i915#3239</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6033 -&gt; IGTPW_5607</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9860: 2f5c82c9a6a468ec8b20a3bb322c3289fb05e77b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html<br />
  IGT_6033: ecfe4c613cdbc082e4a561ead120b40349b63f2b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2003096784194543328==--

--===============1692766834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1692766834==--
