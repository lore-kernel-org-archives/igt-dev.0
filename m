Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 10 Dec 2020 03:18:52 -0000
Message-ID: <160757033232.19115.16677174018331909647@emeril.freedesktop.org>
References: <20201210020907.2392245-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201210020907.2392245-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev12=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0789850106=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0789850106==
Content-Type: multipart/alternative;
 boundary="===============6351923542495872486=="

--===============6351923542495872486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev12)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5887 -> IGTPW_5265
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5265 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5265, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5265:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-snb-2600:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html

  
Known issues
------------

  Here are the changes found in IGTPW_5265 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][3] ([fdo#109271]) +22 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][4] ([i915#2283])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [PASS][5] -> [INCOMPLETE][6] ([i915#2750])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#165])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-tgl-y/igt@prime_vgem@basic-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-tgl-y/igt@prime_vgem@basic-read.html

  * igt@runner@aborted:
    - fi-snb-2600:        NOTRUN -> [FAIL][11] ([i915#698])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-snb-2600/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7500u:       [DMESG-WARN][12] ([i915#2605]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][14] ([i915#402]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#2750]: https://gitlab.freedesktop.org/drm/intel/issues/2750
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5887 -> IGTPW_5265

  CI-20190529: 20190529
  CI_DRM_9467: 97bdde324e46e276a88de5d2d0c759b4309173c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html
  IGT_5887: 7d87d0f1a22544e6a78dc0920b3f54b64144a029 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@fairslice
+igt@gem_exec_schedule@fairslice-all
+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-flow-ping
+igt@gem_exec_schedule@fair-flow-share
+igt@gem_exec_schedule@fair-flow-solo
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-half-solo
+igt@gem_exec_schedule@fair-next
+igt@gem_exec_schedule@fair-next-ping
+igt@gem_exec_schedule@fair-next-share
+igt@gem_exec_schedule@fair-next-solo
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-none-ping
+igt@gem_exec_schedule@fair-none-rrul
+igt@gem_exec_schedule@fair-none-share
+igt@gem_exec_schedule@fair-none-solo
+igt@gem_exec_schedule@fair-none-vip
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-pace-ping
+igt@gem_exec_schedule@fair-pace-share
+igt@gem_exec_schedule@fair-pace-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-spare-solo
+igt@gem_exec_schedule@fair-sync
+igt@gem_exec_schedule@fair-sync-solo
+igt@gem_exec_schedule@fair-sync-vip
+igt@gem_exec_schedule@fair-throttle
+igt@gem_exec_schedule@fair-throttle-rrul
+igt@gem_exec_schedule@fair-throttle-share
+igt@gem_exec_schedule@fair-throttle-solo
+igt@gem_exec_schedule@fair-throttle-vip
+igt@gem_exec_schedule@u-fairslice
+igt@gem_exec_schedule@u-fairslice-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html

--===============6351923542495872486==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairness (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5887 -&gt; IGTPW_5265</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5265 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5265, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5265:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5265 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2750">i915#2750</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-snb-2600/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/698">i915#698</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5887/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5887 -&gt; IGTPW_5265</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9467: 97bdde324e46e276a88de5d2d0c759b4309173c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5265/index.html<br />
  IGT_5887: 7d87d0f1a22544e6a78dc0920b3f54b64144a029 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_schedule@fairslice<br />
+igt@gem_exec_schedule@fairslice-all<br />
+igt@gem_exec_schedule@fair-flow<br />
+igt@gem_exec_schedule@fair-flow-ping<br />
+igt@gem_exec_schedule@fair-flow-share<br />
+igt@gem_exec_schedule@fair-flow-solo<br />
+igt@gem_exec_schedule@fair-half<br />
+igt@gem_exec_schedule@fair-half-solo<br />
+igt@gem_exec_schedule@fair-next<br />
+igt@gem_exec_schedule@fair-next-ping<br />
+igt@gem_exec_schedule@fair-next-share<br />
+igt@gem_exec_schedule@fair-next-solo<br />
+igt@gem_exec_schedule@fair-none<br />
+igt@gem_exec_schedule@fair-none-ping<br />
+igt@gem_exec_schedule@fair-none-rrul<br />
+igt@gem_exec_schedule@fair-none-share<br />
+igt@gem_exec_schedule@fair-none-solo<br />
+igt@gem_exec_schedule@fair-none-vip<br />
+igt@gem_exec_schedule@fair-pace<br />
+igt@gem_exec_schedule@fair-pace-ping<br />
+igt@gem_exec_schedule@fair-pace-share<br />
+igt@gem_exec_schedule@fair-pace-solo<br />
+igt@gem_exec_schedule@fair-spare<br />
+igt@gem_exec_schedule@fair-spare-solo<br />
+igt@gem_exec_schedule@fair-sync<br />
+igt@gem_exec_schedule@fair-sync-solo<br />
+igt@gem_exec_schedule@fair-sync-vip<br />
+igt@gem_exec_schedule@fair-throttle<br />
+igt@gem_exec_schedule@fair-throttle-rrul<br />
+igt@gem_exec_schedule@fair-throttle-share<br />
+igt@gem_exec_schedule@fair-throttle-solo<br />
+igt@gem_exec_schedule@fair-throttle-vip<br />
+igt@gem_exec_schedule@u-fairslice<br />
+igt@gem_exec_schedule@u-fairslice-all</p>

</body>
</html>

--===============6351923542495872486==--

--===============0789850106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0789850106==--
