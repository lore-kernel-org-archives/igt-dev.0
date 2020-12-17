Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Dec 2020 12:14:23 -0000
Message-ID: <160820726330.2012.1037854693750917@emeril.freedesktop.org>
References: <20201217103812.1174024-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20201217103812.1174024-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_intel=5Fgpu=5Ftop=3A_Support_e?=
 =?utf-8?q?xiting_the_tool_by_pressing_=27q=27?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2084481077=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2084481077==
Content-Type: multipart/alternative;
 boundary="===============5655327496948844794=="

--===============5655327496948844794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] intel_gpu_top: Support exiting the tool by pressing 'q'
URL   : https://patchwork.freedesktop.org/series/85039/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5906 -> IGTPW_5305
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5305 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5305, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5305:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gtt:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-bsw-kefka/igt@i915_selftest@live@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-bsw-kefka/igt@i915_selftest@live@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_5305 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-tgl-y:           [PASS][6] -> [DMESG-FAIL][7] ([i915#2601])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [DMESG-WARN][8] ([i915#402]) -> [PASS][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [FAIL][10] ([i915#579]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [INCOMPLETE][12] ([i915#2750]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@hugepages:
    - fi-bsw-kefka:       [DMESG-WARN][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-bsw-kefka/igt@i915_selftest@live@hugepages.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-bsw-kefka/igt@i915_selftest@live@hugepages.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [DMESG-FAIL][16] ([i915#165]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [SKIP][18] ([fdo#109271]) -> [FAIL][19] ([i915#579])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
  [i915#2750]: https://gitlab.freedesktop.org/drm/intel/issues/2750
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (42 -> 38)
------------------------------

  Missing    (4): fi-dg1-1 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5906 -> IGTPW_5305

  CI-20190529: 20190529
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5305: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html
  IGT_5906: f5b022a2e5054ee7e335d7856344807308db6d6f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html

--===============5655327496948844794==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] intel_gpu_top: Support exiting the tool by pressing &#39;q&#39;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85039/">https://patchwork.freedesktop.org/series/85039/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5906 -&gt; IGTPW_5305</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5305 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5305, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5305:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gtt:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-bsw-kefka/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-bsw-kefka/igt@i915_selftest@live@gtt.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5305 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-subslice-total:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2601">i915#2601</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-tgl-y/igt@gem_mmap_gtt@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-tgl-y/igt@gem_mmap_gtt@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2750">i915#2750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-bsw-kefka/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-bsw-kefka/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): fi-dg1-1 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5906 -&gt; IGTPW_5305</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5305: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5305/index.html<br />
  IGT_5906: f5b022a2e5054ee7e335d7856344807308db6d6f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5655327496948844794==--

--===============2084481077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2084481077==--
