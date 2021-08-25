Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0281266217342313707=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Aug 2021 17:47:42 -0000
Message-ID: <162991366289.17673.5390062990605668344@emeril.freedesktop.org>
References: <20210825171018.10821-1-jeevan.b@intel.com>
In-Reply-To: <20210825171018.10821-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IGtt?=
 =?utf-8?q?s=5Fpsr2=5Fsf_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0281266217342313707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kms_psr2_sf test
URL   : https://patchwork.freedesktop.org/series/94030/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10520 -> IGTPW_6156
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html

Known issues
------------

  Here are the changes found in IGTPW_6156 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [PASS][2] -> [DMESG-WARN][3] ([i915#3958])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-1115g4:      [DMESG-WARN][4] ([i915#1982] / [i915#4002]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [DMESG-WARN][6] ([i915#4002]) -> [DMESG-FAIL][7] ([i915#1888])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958
  [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002


Participating hosts (40 -> 33)
------------------------------

  Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-icl-y fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6185 -> IGTPW_6156

  CI-20190529: 20190529
  CI_DRM_10520: df6d856ea920279c17e875a80fca47a428fd7fcd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@plane-move-sf-dmg-area
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5
-igt@kms_psr2_sf@plane-move-sf-dmg-area-0
-igt@kms_psr2_sf@plane-move-sf-dmg-area-1
-igt@kms_psr2_sf@plane-move-sf-dmg-area-2
-igt@kms_psr2_sf@plane-move-sf-dmg-area-3
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html

--===============0281266217342313707==
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
<tr><td><b>Series:</b></td><td>Fix kms_psr2_sf test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94030/">https://patchwork.freedesktop.org/series/94030/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10520 -&gt; IGTPW_6156</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6156 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10520/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 33)</h2>
<p>Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-icl-y fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6185 -&gt; IGTPW_6156</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10520: df6d856ea920279c17e875a80fca47a428fd7fcd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6156/index.html<br />
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-0<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-1<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-2<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-3<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5</p>

</body>
</html>

--===============0281266217342313707==--
