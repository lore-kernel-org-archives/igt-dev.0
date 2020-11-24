Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 11:34:53 -0000
Message-ID: <160621769396.10862.16260880753670688173@emeril.freedesktop.org>
References: <20201124094149.1004-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201124094149.1004-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_Subtest_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1713649562=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1713649562==
Content-Type: multipart/alternative;
 boundary="===============3058036457638067742=="

--===============3058036457638067742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic Subtest (rev5)
URL   : https://patchwork.freedesktop.org/series/83576/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9382 -> IGTPW_5215
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html

Known issues
------------

  Here are the changes found in IGTPW_5215 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([i915#1161] / [i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
    - fi-cml-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-tgl-y/igt@prime_vgem@basic-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic:
    - fi-icl-u2:          [INCOMPLETE][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-icl-u2/igt@gem_exec_create@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-icl-u2/igt@gem_exec_create@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [DMESG-WARN][13] ([i915#402]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 39)
------------------------------

  Additional (1): fi-blb-e6850 
  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5869 -> IGTPW_5215

  CI-20190529: 20190529
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5215: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html
  IGT_5869: 5236e5d4be3ab5e2fedacc32152120b7fb77bf9f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic_transition@modeset-transitions
-igt@kms_atomic_transition@1x-modeset-transitions
-igt@kms_atomic_transition@1x-modeset-transitions-fencing
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@2x-modeset-transitions
-igt@kms_atomic_transition@2x-modeset-transitions-fencing
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@3x-modeset-transitions
-igt@kms_atomic_transition@3x-modeset-transitions-fencing
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@4x-modeset-transitions
-igt@kms_atomic_transition@4x-modeset-transitions-fencing
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@5x-modeset-transitions
-igt@kms_atomic_transition@5x-modeset-transitions-fencing
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@6x-modeset-transitions
-igt@kms_atomic_transition@6x-modeset-transitions-fencing
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html

--===============3058036457638067742==
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
<tr><td><b>Series:</b></td><td>Added dynamic Subtest (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83576/">https://patchwork.freedesktop.org/series/83576/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9382 -&gt; IGTPW_5215</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5215 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-icl-u2/igt@gem_exec_create@basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-icl-u2/igt@gem_exec_create@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (1): fi-blb-e6850 <br />
  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5869 -&gt; IGTPW_5215</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5215: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5215/index.html<br />
  IGT_5869: 5236e5d4be3ab5e2fedacc32152120b7fb77bf9f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_atomic_transition@modeset-transitions<br />
-igt@kms_atomic_transition@1x-modeset-transitions<br />
-igt@kms_atomic_transition@1x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions<br />
-igt@kms_atomic_transition@2x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions<br />
-igt@kms_atomic_transition@3x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions<br />
-igt@kms_atomic_transition@4x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions<br />
-igt@kms_atomic_transition@5x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions<br />
-igt@kms_atomic_transition@6x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing</p>

</body>
</html>

--===============3058036457638067742==--

--===============1713649562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1713649562==--
