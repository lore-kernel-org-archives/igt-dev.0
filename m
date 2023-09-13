Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2957515930966207972=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Sep 2023 00:40:10 -0000
Message-ID: <169456561035.31251.17076564804815816346@emeril.freedesktop.org>
References: <20230912234954.2110973-1-matthew.brost@intel.com>
In-Reply-To: <20230912234954.2110973-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_XE=5FEXEC=5FQUEUE=5FSET=5FPROPERTY=5FCOMPUTE=5FMODE_from_Xe_uA?=
 =?utf-8?q?PI?=
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

--===============2957515930966207972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from Xe uAPI
URL   : https://patchwork.freedesktop.org/series/123619/
State : success

== Summary ==

CI Bug Log - changes from IGT_7482 -> IGTPW_9778
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_9778 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          NOTRUN -> [INCOMPLETE][1] ([i915#8797] / [i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-8:          [PASS][2] -> [INCOMPLETE][3] ([i915#8797] / [i915#9275])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [PASS][4] -> [FAIL][5] ([i915#9276])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][6] -> [FAIL][7] ([IGT#3] / [i915#6121])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [INCOMPLETE][8] ([i915#8797] / [i915#9275]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [ABORT][10] ([i915#7911] / [i915#7913]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hugepages:
    - bat-mtlp-8:         [DMESG-WARN][12] ([i915#9121]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-mtlp-8/igt@i915_selftest@live@hugepages.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-mtlp-8/igt@i915_selftest@live@hugepages.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:
    - bat-adlp-11:        [DMESG-WARN][14] ([i915#6868]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html

  * igt@kms_flip@basic-plain-flip@b-dp5:
    - bat-adlp-11:        [FAIL][16] ([i915#6121]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp5.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp5.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-11:        [FAIL][18] -> [SKIP][19] ([i915#4093])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
  [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7482 -> IGTPW_9778

  CI-20190529: 20190529
  CI_DRM_13623: eb35627e1c4a3781c161cd04944e403ce6df3e1c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html
  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html

--===============2957515930966207972==
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
<tr><td><b>Series:</b></td><td>Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from Xe uAPI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123619/">https://patchwork.freedesktop.org/series/123619/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7482 -&gt; IGTPW_9778</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-hsw-4770 fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9778 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-mtlp-8/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-mtlp-8/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp5.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7482/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7482 -&gt; IGTPW_9778</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13623: eb35627e1c4a3781c161cd04944e403ce6df3e1c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html<br />
  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2957515930966207972==--
