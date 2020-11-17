Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Nov 2020 18:50:48 -0000
Message-ID: <160563904848.25708.13342479346801056470@emeril.freedesktop.org>
References: <20201117163411.133158-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201117163411.133158-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/3=5D_lib/igt=5Fdevice=5Fscan?=
 =?utf-8?q?=3A_Remember_vendor/device_for_pci_devices?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1627317957=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1627317957==
Content-Type: multipart/alternative;
 boundary="===============4532481241488724647=="

--===============4532481241488724647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/3] lib/igt_device_scan: Remember vendor/device for pci devices
URL   : https://patchwork.freedesktop.org/series/83978/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9348 -> IGTPW_5181
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5181 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5181, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5181:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-y:           NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-tgl-y/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_5181 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][2] -> [DMESG-WARN][3] ([i915#1982])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-byt-j1900:       [DMESG-WARN][4] ([i915#1982]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-byt-j1900/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-byt-j1900/igt@i915_module_load@reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][6] ([i915#1982]) -> [PASS][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982


Participating hosts (42 -> 41)
------------------------------

  Additional (3): fi-kbl-soraka fi-blb-e6850 fi-tgl-y 
  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5181

  CI-20190529: 20190529
  CI_DRM_9348: 8dc6152ada31b8d128be55f1dacc13c2b5b61666 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5181: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html

--===============4532481241488724647==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/3] lib/igt_device_scan: Remember vendor/device for pci devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83978/">https://patchwork.freedesktop.org/series/83978/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9348 -&gt; IGTPW_5181</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5181 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5181, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5181:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-tgl-y/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5181 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-byt-j1900/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9348/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (3): fi-kbl-soraka fi-blb-e6850 fi-tgl-y <br />
  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5181</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9348: 8dc6152ada31b8d128be55f1dacc13c2b5b61666 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5181: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5181/index.html<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4532481241488724647==--

--===============1627317957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1627317957==--
